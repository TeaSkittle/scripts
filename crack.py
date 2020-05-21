#!/usr/bin/env python3
# (c) Travis Dowd
# Date started: 5-20-2020
#
# Simple password cracker
#
# TODO: * Add a progress bar, percentage, or time left
#	* Add threaded functionality
#

import crypt
import argparse

def testPass( cryptPass, dictFile ):
    salt = cryptPass[0:24]
    dictFile = open( dictFile, "r" )
    for word in dictFile:
        word = word.strip( '\n' ) 
        cryptWord = crypt.crypt( word, salt )
        if ( cryptWord == cryptPass ):
            print( word + " - ", end='')
            return True
        else:
            return False

def main():
    parser = argparse.ArgumentParser(description="Crack passwords using a dictionary attack. \
        Must supply a diciontary file (for example: rockyou.txt), and also you must supply a \
        file containing the username and hashed password in this format: UserName: hashed_password. \
        This is the same format as the *NIX /etc/shadow file.")
    parser.add_argument("-d", help="dictionary file to check passwords against")
    parser.add_argument("-p", help="file containing password hashes and user names")
    args = parser.parse_args()
    if args.p and args.d:
        crackPass( args.p, args.d )
    else:
        print( parser.print_help() )      
    
def crackPass( hashFile, dictFile ):
    print( "Pass - User" )
    print ("-----------\n" )
    passFile = open( hashFile , "r" )
    for line in passFile.readlines():
        if ":" in line:
            user = line.split(':')[0]
            cryptPass = line.split(':')[1].strip(' ')
            if testPass( cryptPass, dictFile ) == True:
                print( user )

if __name__ == "__main__":
    main()
