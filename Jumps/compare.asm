;Mostrar mensaje
%macro print 2 
    mov eax, 4 ;llamada al sistema
    mov ebx, 1 ;stándar
    mov ecx, %1 ;apuntar al mensaje
    mov edx, %2 ;LOngitud de cadena
    int 80h
%endmacro
;Leer dato
%macro read 2
    mov eax, 3 ;llamada al sistema
    mov ebx, 2 ;stándar
    mov ecx, %1 ;apuntar a referencia en memoria
    mov edx, %2 ;LOngitud de cadena
    int 80h
%endmacro
section .data
    mess db "Ingrese un numero del 1-4", 10
    len equ $- mess
    mess1 db "Eligio 1", 10
    leng1 equ $-mess1
    mess2 db "Eligio 2", 10
    leng2 equ $-mess2
    mess3 db "Eligio 3", 10
    leng3 equ $-mess3
    mess4 db "Eligio 4", 10
    leng4 equ $-mess4
section .bss 
    n resb 1
section .text
    global _start
_start:
    print mess, len
    read n, 2
    mov al, [n]
    sub al, '0'
    ;Comparar el valor ingresado con 1
    cmp al, 1
    je uno
    cmp al, 2
    je dos
    cmp al, 3
    je tres
    cmp al, 4
    je cuatro
    ;En caso de que no cumpla ni una de las condiciones
    jmp Salir
uno:
    print mess1, leng1
    jmp Salir
dos:
    print mess2, leng2
    jmp Salir
tres:
    print mess3, leng3
    jmp Salir
cuatro:
    print mess4, leng4
Salir:
    mov eax, 1
    int 80h