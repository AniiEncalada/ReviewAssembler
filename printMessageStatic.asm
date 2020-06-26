section .data
    mess db "Hola mundo", 10
    len equ $- mess
;section .bss No se requiere

section .text
    global _start:
_start:
    ;***Mostrar mensaje***
    mov eax, 4 ;llamada al sistema
    mov ebx, 1 ;stándar
    mov ecx, mess ;apuntar al mensaje
    mov edx, len ;LOngitud de cadena
    int 80h

    mov eax, 1
    int 80h