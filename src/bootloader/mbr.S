/**
* mbr.S
* Created by Matheus Leme Da Silva
* Licensa MIT
*/
.code16
.org 0x0

// Jump
jmp _start
nop

// BPB
BS_OemName: .ascii "MSDOS5.0" // Para compatibilidade
BPB_BytesPerSec: .word 512
BPB_SecPerClus: .byte 8 // Clusters de 4K
BPB_RsvdSecCnt: .word 32 // "Padrão"
BPB_:

.globl _start
_start:


.org 510
.byte 0x55, 0xaa

