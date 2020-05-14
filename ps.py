#!/usr/bin/python3
# Simple port scanner

import sys
import socket

s = socket.socket( socket.AF_INET, socket.SOCK_STREAM )
target = sys.argv[ 1 ]

# Port scanner
def scan( port ):
    try:
        con = s.connect(( target, port ))
        return True
    except:
        return False

# DNS lookup
def look( server ):
	try:
		server_ip = socket.gethostbyname( server )
		print( server_ip )
	except:
		print( "ERROR: Can't find hostname" )

def main():	
	print( "Scanning ", target, "..." )
	look( target )
	print( "" )
	print( "Open ports: " )
	for x in range( 63535 ):
		if scan( x ):
			print( x )

if __name__ == "__main__":
	main()
