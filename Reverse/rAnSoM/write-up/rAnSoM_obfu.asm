section .data
    secret_filename db 'secrets.txt', 0
    enc_filename db 'secrets.txt.enc', 0

section .bss
    utsname resb 390
    secret_content resb 1024
    secret_fd resd 1
    enc_fd resd 1

section .text
global _start

_start:
lb1739a95c4afc720:

    xor eax, eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    mov ebx, secret_filename
    xor ecx, ecx
    int 0x80
    mov [secret_fd], eax


    xor eax, eax
    inc eax
    inc eax
    inc eax
    mov ebx, [secret_fd]
    mov ecx, secret_content
    mov edx, 1024
    int 0x80


    xor eax, eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    mov ebx, [secret_fd]
    int 0x80


    mov esi, secret_content

lbfffa385ad5f9319:

    xor eax, eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    mov ebx, utsname
    int 0x80
    add ebx, 65
    xor ecx, ecx

le013758b006e104e:

    mov al, [esi]
    mov dl, [ebx + ecx]
    cmp al, 0
    je ld6b0cc60e20f8f45
    xor al, dl
    inc al
    mov [esi], al

    push eax
    jmp $+3
    mov al, 46h
    pop eax

    push eax
    jmp $+3
    mov al, 41h
    pop eax
    cmp ecx, 6
    jl le013758b006e104e
    xor ecx, ecx
    jmp le013758b006e104e

ld6b0cc60e20f8f45:

    xor eax, eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    mov ebx, enc_filename
    mov ecx, 0666o
    int 0x80
    mov [enc_fd], eax


    xor eax, eax
    inc eax
    inc eax
    inc eax
    inc eax
    mov ebx, [enc_fd]
    mov ecx, secret_content
    mov edx, 18
    int 0x80


    xor eax, eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    inc eax
    mov ebx, [enc_fd]
    int 0x80


    xor eax, eax
    inc eax
    xor ebx, ebx
    int 0x80

