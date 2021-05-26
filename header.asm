;name: elf64header.asm
;
;build: nasm -fbin -o header header.asm && chmod +x header
bits 64
    org    0x00400000      ;offset de chargement du programme

;64-bit ELF header
ehdr:
    ; debut de tout executable ELF
    db 0x7F, "ELF", 2, 1, 1, 0

    times 8 db 0

    dw 2                    ;e_type:       type de fichier
    dw 0x3e                 ;e_machine:    architecture
    dd 1                    ;e_version:    version actuelle
    dq _start               ;e_entry:      point d'entree du ptogramme address (0x78)
    dq phdr - $$            ;e_phoff       offset du header(0x40)
    dq 0                    ;e_shoff       no section headers
    dd 7                    ;e_flags       no flags
    dw ehdrsize             ;e_ehsize:     ELF header size (0x40)
    dw phdrsize             ;e_phentsize:  program header size (0x38)
    dw 1                    ;e_phnum:      one program header
    dw 0                    ;e_shentsize
    dw 0                    ;e_shnum
    dw 0 
                       ;e_shstrndx
ehdrsize equ $ - ehdr

;64-bit ELF program header
phdr:
    dd 1
    dd 7
    dq 0
    dq $$
    dq $$
    dq filesize
    dq filesize
    dq 0x200000

; taille du programme
phdrsize equ $ - phdr

_start:
; on set up la clé de cryptage
mov r10, 0x8E4E54DE6596DAEC
mov rax, 0x400203
mov rcx, 0x160

; routine de decryptage XOR
decrypt:
sub rax, 8
mov rbx,[rax]
xor rbx,  r10 ;
mov qword [rax], rbx
sub rcx, 8
jnz decrypt

; on calcule la nouvelle taille du fichier
filesize equ $ - $$