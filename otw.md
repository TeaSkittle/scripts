# Over the Wire - bandit

## Connect
N = level number  
```bash
ssh -p 2220 banditN@bandit.labs.overthewire.org
```

## Flags
9 - UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR

## Notes
* To read a file starting with a -
```bash
$ cat ./-file
```
* The __file__ command is very useful for displaying info
* With ls -l owner is beofre group
```bash
$ ls -l
drwxr-xr-x 2 OWNER GROUP date/time file
```
* Find file by ownership:
```bash
$ find directory_name -group group_name -user user_name
$ find / -group wheel -user -TeaSkittle
```

