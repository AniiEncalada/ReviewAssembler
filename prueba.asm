%macro imprimir 2
mov eax, 4
mov ebx, 1
mov ecx,%1
mov edx,%2
int 80h
%endmacro

%macro leer 2
mov eax, 3
mov ebx, 2
mov ecx,%1
mov edx,%2
int 80h
%endmacro

section .data
    n1 db "ingrese un numero",10
    len equ $-n1

    n2 db "ingrese otro numero ",10
    len0 equ $-n2


    resp1 db "mayor"
    len1 equ $-resp1

    resp2 db "menor"
    len2 equ $-resp2

    resp3 db "igual"
    len3 equ $-resp3


section .bss
    numero1 resb 1
    numero2 resb 1

section .text
    global _start:
_start:


imprimir  n1,len
leer numero1, 2

imprimir  n2,len0
leer numero2, 2 

    mov al ,[numero1]
    mov bl ,[numero2]
    sub al ,'0'
    sub bl ,'0'
    cmp al, bl
    jl menor
    jg  mayor
    je igual
    jmp salir


mayor:
    imprimir resp1,len1
    jmp salir
menor:
    imprimir resp2,len2
    jmp salir
igual:
    imprimir resp3,len3
    jmp salir

salir:
    mov eax, 1
    int 80h