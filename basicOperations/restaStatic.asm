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
    mov ecx, text ;apuntar a referencia en memoria
    mov edx, 20 ;LOngitud de cadena
    int 80h
%endmacro
section .data
    mess db "El resultado de la suma es:", 10
    len equ $- mess
section .bss 
    suma resb 1
section .text
    global _start
_start:
    print mess, len
    mov ax, 3 ;moviendo cadena
    mov bx, 2 ;moviendo cadena
    sub ax, '0';convertir en número
    sub bx, '0';convertir en número
    sub ax, bx ;Suma
    add ax, '0';Convertir a cadena
    mov [suma], ax;mover el resultado a una variable
    print suma, 2;Presentar resultado
    ;Salir
    mov eax, 1
    int 80h