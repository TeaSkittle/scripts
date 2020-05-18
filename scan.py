#!/usr/bin/python3
# Simple port scanner

import sys
import socket

s = socket.socket( socket.AF_INET, socket.SOCK_STREAM )
s.settimeout( 5 )
target = sys.argv[ 1 ]	

# Most common ports
def ports( number ):
	if number == 20:
		return 'ftp - Data'
	elif number == 21:
		return 'ftp - Control'
	elif number == 22:
		return 'ssh'
	elif number == 23:
		return 'telnet'
	elif number == 25:
		return 'smtp'
	elif number == 25:
		return 'dns'
	elif number == 80:
		return 'http'
	elif number == 110:
		return 'pop3'
	elif number == 119:
		return 'nntp'
	elif number == 123:
		return 'ntp'
	elif number == 143:
		return 'imap'
	elif number == 161:
		return 'snmp'
	elif number == 194:
		return 'irc'
	elif number == 443:
		return 'https'
	else:
		return 'uncommon'


# Port scanner
def scan( port ): 
	try:
		s.connect(( target, port ))
		s.close()
		return True
	except:
		pass
		return False

# DNS lookup
def look( server ):
	try:
		server_ip = socket.gethostbyname( server )
		print( server_ip )
		return True
	except:
		print( "ERROR: Can't find hostname" )
		return False

def main():	
	print( "Scanning ", target, "..." )
	look( target )
	print( "" )
	print( "Open ports: " )
	# total number of ports: 63535
	# total takes forever and is not super usefull
	for x in range( 1024 ):
		if scan( x ):
			print( ports( x ), " - ", x )

if __name__ == "__main__":
	main()
