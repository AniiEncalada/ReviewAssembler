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
    mess db "Ingrese un numero del 1-9", 10
    len equ $- mess
    mess1 db "El primer número es mayor", 10
    leng1 equ $-mess1
    mess2 db "El primer numero es menor", 10
    leng2 equ $-mess2
    mess3 db "Los números son iguales", 10
    leng3 equ $-mess3

section .bss 
    n1 resb 1
    n2 resb 1
section .text
    global _start
_start:
    print mess, len
    read n1, 2
    print mess, len
    read n2, 2
    mov al, [n1]
    sub al, '0'
    mov ah, [n2]
    sub ah, '0'
    ;Comparar el valor ingresado con 1
    cmp al, ah
    je igual
    jg mayor
    jl menor
    
    ;En caso de que no cumpla ni una de las condiciones
    jmp Salir
mayor:
    print mess1, leng1
    jmp Salir
menor:
    print mess2, leng2
    jmp Salir
igual:
    print mess3, leng3
    jmp Salir
Salir:
    mov eax, 1
    int 80h