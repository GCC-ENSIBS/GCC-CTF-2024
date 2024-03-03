from pwn import xor

key = b"debian"

min_1_secrets = [] 
with open("secrets.txt.enc", "rb") as secrets_file:
    secrets = secrets_file.read()
    for c in secrets:
        min_1_secrets.append(c - 1)

print(xor(min_1_secrets, key))
