#!/usr/bin/python3
# Author: Travis Dowd
# Date: 5-9-2020
# Convert decimal, hex, and binary numbers

import sys

# Show command line arguments
def listHelp():
	print( "" )
	print( "Flags:" )
	print( "-dh -> decimal to hexadecimal" )
	print( "-db -> decimal to binary"      )
	print( "-bd -> binary to decimal"      )
	print( "-bh -> binary to hexadeciaml"  )	
	print( "-hd -> hexadecimal to decimal" )
	print( "-hb -> hexadeciaml to binary"  )
	print( "" )
	print( "No flag will run interactive mode, which converts bin/hex to dec." )
	print( "" )

# Conversion functions
decToHex = ( lambda x: hex( int( x )))
decToBin = ( lambda x: bin( int( x )))
binToDec = ( lambda x: str( int( x, 2 )))
binToHex = ( lambda x: hex( int( x, 2 )))
hexToDec = ( lambda x: str( int( x, 16 )))
hexToBin = ( lambda x: str( bin( int( x, 16 ))))

# Comparison functions
# NOTE: Not being used
isDec = (lambda x: True if ( int( x, 10 )) else False )
isHex = (lambda x: True if ( int( x, 16 )) else False )
isBin = (lambda x: True if ( int( x, 2  )) else False )
	
# Calc
def calc( x ):
	try:	
		print( binToDec( x ))
	except ValueError:
		try: 
			print( hexToDec( x ))
		except ValueError:
			print( "ERROR: Unkown value" )

# Convert switch
def convert():
	# Set x and y
	x = sys.argv[2]
	y = sys.argv[1]
	# Choose switch type
	if len(sys.argv) == 3:	
		if y == "-dh":
			print( decToHex( x ))
		elif y == "-db":
			print( decToBin( x ))
		elif y == "-bd":
			print( binToDec( x ))
		elif y == "-bh":
			print( binToHex( x ))			
		elif y == "-hd":
			print( hexToDec( x ))
		elif y == "-hb":
			print( hexToBin( x ))


# Prompt
def prompt():
	running = True
	while running:
		x = input("> ")
		if x == "Exit" or x == "exit" or x == "Quit" or x == "quit":
			sys.exit()
		else:
			calc( x )	


# Main function
def main():
	if len(sys.argv) < 2:
		prompt()
	else:
		if sys.argv[1] == "-help" or sys.argv[1] == "-Help" or sys.argv[1] == "-h":
			listHelp()
		else:
			convert()

# Run main()
if __name__ == "__main__":
	main()
