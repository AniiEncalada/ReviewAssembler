# ReviewAssembler
Revisión básica del lenguaje ensamblador con NASM en una distribución de Linux

Para compilar el script se de ejecutar

    nasm -f elf nombre.asm
Esto crea un archivo con el mismo nombre pero con extensión **.o**. La siguiente instrucción ya genera un ejecutable sin extención a partir del *archivo.o*

    ld -m elf_i386 -s -o nombreEjecutable nombre.o
El *nombreEjecutable* corresponde a cualquier nombre que se quiera dar al ejecutable a obtener. Este se puede ejecutar accediendo a él:

    ./nombreEjecutable
#### Saltos
Punto de un programa informático donde el flujo del programa se ve alterado. Es decir se desplaza a ubicaciones del código indicadas por etiquetas, es decir, se acompaña la instrucción de salto con el nombre de la etiqueta hacia donde se quiere direccionar

    salto etiqueta
    jmp presentar

Definir una comparación se usa la directriz *cmp* que recibe 2 parámetros a comparar.

<table style="width: 100%; text-align: center;">
  <tr>
    <td style="width: 23%;"><b>Salto</b></td>
    <td style="width: 23%;"><b>Descripción</b></td>
    <td style="width: 23%;"><b>Negación</b></td>
  </tr>
  <tr>
    <td style="width: 23%;">jmp</td>
    <td style="width: 23%;">salto simple</td>
    <td style="width: 23%;">-</td>
  </tr>
  <tr>
    <td style="width: 23%;">je</td>
    <td style="width: 23%;">salto cuando los valores son iguales</td>
    <td style="width: 23%;">jne</td>
  </tr>
  <tr>
    <td style="width: 23%;">jg</td>
    <td style="width: 23%;">salto cuando el primer valor es mayor</td>
    <td style="width: 23%;">jng</td>
  </tr>
  <tr>
    <td style="width: 23%;">jl</td>
    <td style="width: 23%;">salto cuando el primer valor es menor</td>
    <td style="width: 23%;">jnl</td>
  </tr>
  <tr>
    <td style="width: 23%;">jge</td>
    <td style="width: 23%;">salto cuando el primer valor es igual o mayor</td>
    <td style="width: 23%;">jnge</td>
  </tr>
  <tr>
    <td style="width: 23%;">jle</td>
    <td style="width: 23%;">salto cuando el primer valor es menor o igual</td>
    <td style="width: 23%;">jnle</td>
  </tr>
</table>
