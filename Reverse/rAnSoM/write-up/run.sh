python3 obfuscator.py > rAnSoM_obfu.asm && \
	nasm -f elf32 rAnSoM_obfu.asm -o ransom.o && \
	ld -m elf_i386 ransom.o -o ransom && \
	./ransom && \
	xxd secrets.txt.enc
