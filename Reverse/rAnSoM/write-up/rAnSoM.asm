section .data
    secret_filename db 'secrets.txt', 0     ; Filename of the secret file to be encrypted.
    enc_filename db 'secrets.txt.enc', 0    ; Filename of the encrypted output file.

section .bss
    utsname resb 390                        ; Buffer to store system information structure returned by uname.
    secret_content resb 1024                ; Buffer to temporarily store the content of the secret file.
    secret_fd resd 1                        ; File descriptor for the secret file.
    enc_fd resd 1                           ; File descriptor for the encrypted file.

section .text
global _start

_start:
open_secret_file:
    ; Open the secret file for reading
    mov eax, 5                             ; syscall number for sys_open
    mov ebx, secret_filename               ; file name to open
    xor ecx, ecx                           ; open file read-only mode
    int 0x80                               ; execute syscall
    mov [secret_fd], eax                   ; store file descriptor

    ; Read the content of the secret file into buffer
    mov eax, 3                             ; syscall number for sys_read
    mov ebx, [secret_fd]                   ; file descriptor
    mov ecx, secret_content                ; buffer to store content
    mov edx, 1024                          ; max number of bytes to read
    int 0x80                               ; execute syscall

	; Close the secret file
    mov eax, 6                             ; syscall number for sys_close
    mov ebx, [secret_fd]                   ; file descriptor to close
    int 0x80                               ; execute syscall

    ; Encrypt the content of the buffer
    mov esi, secret_content                ; pointer to the start of the buffer

get_hostname:
    ; Retrieve system information including the hostname (nodename).
    mov eax, 122                           ; uname syscall number.
    mov ebx, utsname                       ; Pointer to the buffer for uname structure.
    int 0x80                               ; Execute syscall.
    add ebx, 65                            ; Adjust pointer to point directly at nodename within utsname structure.
    xor ecx, ecx                           ; Clear ecx to use as counter/index for nodename.

encrypt_loop:
    ; Encrypt the buffer content using XOR with nodename.
    mov al, [esi]                          ; Load byte from secret_content.
    mov dl, [ebx + ecx]                    ; Load corresponding byte from nodename.
    cmp al, 0                              ; Check if end of string/content.
    je open_enc_file                       ; Jump to file creation if end of content reached.
    xor al, dl                             ; XOR current byte with byte from nodename.
    inc al                                 ; Add one to the XORed byte.
    mov [esi], al                          ; Store the encrypted byte back in the buffer.
    inc esi                                ; Move to the next byte in secret_content.
    inc ecx                                ; Increment nodename index.
    cmp ecx, 6                             ; Check if nodename index needs to be reset
    jl encrypt_loop                        ; Continue encrypting if index within bounds.
    xor ecx, ecx                           ; Reset nodename index if it exceeds the max length.
    jmp encrypt_loop                       ; Repeat for the next byte.

open_enc_file:
    ; Open or create the encrypted file
    mov eax, 8                             ; syscall number for sys_creat
    mov ebx, enc_filename                  ; file name to open/create
    mov ecx, 0666o                         ; mode (rw-rw-rw-)
    int 0x80                               ; execute syscall
    mov [enc_fd], eax                      ; store file descriptor

    ; Write the encrypted content to the file
    mov eax, 4                             ; syscall number for sys_write
    mov ebx, [enc_fd]                      ; file descriptor
    mov ecx, secret_content                ; pointer to the encrypted data
    mov edx, 18                             ; length of the data to write
    int 0x80                               ; execute syscall

    ; Close the encrypted file
    mov eax, 6                             ; syscall number for sys_close
    mov ebx, [enc_fd]                      ; file descriptor to close
    int 0x80                               ; execute syscall

    ; Exit the program
    mov eax, 1                             ; syscall number for exit
    xor ebx, ebx                           ; status 0
    int 0x80                               ; execute syscall
