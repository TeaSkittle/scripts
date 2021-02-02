# cnv

## About
This tool is designed to convert whole number values between the three main
bases for programmers: decimal, hexadecimal, and binary. This tool was not
used for doing calcultions with these values, it is just meant to convert
them. You can however pipe the output into another a program or language, I
prefer awk for this use. Example:
```bash
$ ./cnv -hd 0xFF | awk '{print $1 + 2'}
$ 257
```

## Commandline Arguments
* -help -> list help
* -dh -> deciaml to hexadecimal
* -db -> decimal to binary
* -bd -> binary to decimal
* -bh -> binary to hexadecimal
* -hd -> hexadecimal to decimal
* -hb -> hexadecimal to binary  

No arguments will run interactive mode, which takes hexadecimal and binary
input and converts to decimal.
