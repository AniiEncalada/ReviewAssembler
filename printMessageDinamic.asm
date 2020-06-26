section .data
    mess db "Ingrese su mensaje", 10
    len equ $- mess
section .bss 
    text resb 1
section .text
    global _start
_start:
    ;***Mostrar mensaje***
    mov eax, 4 ;llamada al sistema
    mov ebx, 1 ;stándar
    mov ecx, mess ;apuntar a referencia en memoria
    mov edx, len ;Longitud de cadena
    int 80h

    ;***Leer mensaje***
    mov eax, 3 ;llamada al sistema
    mov ebx, 2 ;stándar
    mov ecx, text ;apuntar a referencia en memoria
    mov edx, 20 ;LOngitud de cadena
    int 80h

    ;***Presentar mensaje***
    mov eax, 4 ;llamada al sistema
    mov ebx, 1 ;stándar
    mov ecx, text ;apuntar a referencia en memoria
    mov edx, 20 ;LOngitud de cadena
    int 80h
    ;Salir
    mov eax, 1
    int 80h