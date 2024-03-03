from pwn import remote
import time
from itertools import cycle

while int(time.time())%112 !=0:
	time.sleep(0.2)

r = remote("0.0.0.0",1337)
print("time : ",int(time.time())%112)
r.recvuntil(b"?")

r.sendline(b"49")

c = bytes.fromhex(r.recvline().decode())

crib = b"GCC{"+b"\x00"*28 + b"}"

keystream = bytes([cc^dd if dd != 0 else 0 for cc,dd in zip(c,cycle(crib))])

print(keystream)

keystream = keystream[16*23:]

keystream_block = [0 for _ in range(16)]

for i,k in enumerate(keystream):
	if k != 0:
		keystream_block[i%16] = k
		print(keystream_block)

print(bytes([cc^dd for cc,dd in zip(c[16*23:],cycle(keystream_block))]))