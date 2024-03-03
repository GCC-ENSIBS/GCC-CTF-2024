# rAnSoM

> xanhacks

## Write-up

The secrets file was encrypted with the `hostname` of the victim. The encryption is a simple XOR with one added to each byte.

```python
from pwn import xor

key = b"debian"

min_1_secrets = []
with open("secrets.txt.enc", "rb") as secrets_file:
    secrets = secrets_file.read()
    for c in secrets:
        min_1_secrets.append(c - 1)

print(xor(min_1_secrets, key))
```

A quick homemade assembly obfuscator at [obfuscator.py](obfuscator.py) has been applied on the source code at [rAnSoM.asm](rAnSoM.asm).
