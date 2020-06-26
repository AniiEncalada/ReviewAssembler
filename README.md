# ReviewAssembler
Revisión básica del lenguaje ensamblador con NASM en una distribución de Linux

Para compilar el script se de ejecutar

    nasm -f elf nombre.asm
Esto crea un archivo con el mismo nombre pero con extensión **.o**. La siguiente instrucción ya genera un ejecutable sin extención a partir del *archivo.o*

    ld -m elf_i386 -s -o nombreEjecutable nombre.o
El *nombreEjecutable* corresponde a cualquier nombre que se quiera dar al ejecutable a obtener. Este se puede ejecutar accediendo a él:

    ./nombreEjecutable
La estructura de un script *asm* consta de 2 partes básicas: datos e instrucciones. A su vez, los datos se clasifican en constantes y variables. Su sintaxis es la siguiente:

###### Para declarar datos constantes

    section .data 
Su declaración implica el uso de directrices que indican el tamaño de datos, estas estan formadas por una base *d* que indica la definición seguidas de la longuitud de dato. 
<table style="width: 100%; text-align: center;" title="Tabla 2">
  <tr>
    <td style="width: 23%;"><b>Directriz</b></td>
    <td style="width: 23%;"><b>Descripción</b></td>
  </tr>
  <tr>
    <td style="width: 23%;">DB (Define Byte)</td>
    <td style="width: 23%;">Reservar datos de tamaño byte (8 bits)</td>
  </tr>
  <tr>
    <td style="width: 23%;">DW (Define Word)</td>
    <td style="width: 23%;">Reservar datos de tipo palabra (16 bits)</td>
  </tr>
  <tr>
    <td style="width: 23%;">DD (Define Doubleword)</td>
    <td style="width: 23%;">Reservar datos de tipo doble palabra (32 bits)</td>
  </tr>
  <tr>
    <td style="width: 23%;">DQ (Define Quadword)</td>
    <td style="width: 23%;">Reservar datos de tipo quádruple palabra (64 bits)</td>
  </tr>
  <tr>
    <td style="width: 23%;">DT (Define Terabyte)</td>
    <td style="width: 23%;">Reservar datos de tipo terabyte (80 bits o 10 bytes)</td>
  </tr>
</table>

###### Para declarar datos variables

    section .bss
La directriz a ser usada sigue los mismo lineamientos que se ven en la tabla anterior, pero su base cambia de d a res. Teniendo la sintaxis que se observa en la siguiente tabla.
<table style="width: 100%; text-align: center;" title="Tabla 2">
  <tr>
    <td style="width: 23%;"><b>Directriz</b></td>
    <td style="width: 23%;"><b>Descripción</b></td>
  </tr>
  <tr>
    <td style="width: 23%;">RESB (Define Byte)</td>
    <td style="width: 23%;">Reservar datos de tamaño byte (8 bits)</td>
  </tr>
  <tr>
    <td style="width: 23%;">RESW (Define Word)</td>
    <td style="width: 23%;">Reservar datos de tipo palabra (16 bits)</td>
  </tr>
  <tr>
    <td style="width: 23%;">RESD (Define Doubleword)</td>
    <td style="width: 23%;">Reservar datos de tipo doble palabra (32 bits)</td>
  </tr>
  <tr>
    <td style="width: 23%;">RESQ (Define Quadword)</td>
    <td style="width: 23%;">Reservar datos de tipo quádruple palabra (64 bits)</td>
  </tr>
  <tr>
    <td style="width: 23%;">REST (Define Terabyte)</td>
    <td style="width: 23%;">Reservar datos de tipo terabyte (80 bits o 10 bytes)</td>
  </tr>
</table>

###### Para declarar instrucciones o código
    section .text
      global _start
    _start:
Se indica la sección de código seguido de la declaración de una etiqueta global.

Aquí se indican las instrucciones a ser ejecutadas. Cuando se requiere hacer interrupciones al sistema se debe indicar de acuerdo al sistema operativo, así para distribuciones Linux basadas en Debian la interrupción es:

    int 80H
*int* es una instrucción de interrupción de un solo parámetro
#### Instrucciones
Las instrucciones más comunes son las que se ven en la tabla:
<table style="width: 100%; text-align: center;" title="Tabla 1">
  <tr>
    <td style="width: 23%;"><b>Instrucción</b></td>
    <td style="width: 23%;"><b>Parámetros</b></td>
    <td style="width: 23%;"><b>Función</b></td>
    <td style="width: 23%;"><b>Observación</b></td>
  </tr>
  <tr>
    <td style="width: 23%;">int</td>
   <td style="width: 23%;">1</td> 
   <td style="width: 23%;">Indicar instrucción</td>
    <td style="width: 23%;">El valor varía de un Sistema Operativo a otro</td>
  </tr>
  <tr>
    <td style="width: 23%;">mov</td>
    <td style="width: 23%;">2</td>
    <td style="width: 23%;">Mover puntero de direccipon en memoria</td>
    <td style="width: 23%;">Se mueve el puntero del segundo parámetro al siguiente</td>
  </tr>
  <tr>
    <td style="width: 23%;">Add</td>
    <td style="width: 23%;">2</td>
    <td style="width: 23%;">Realizar suma</td>
    <td style="width: 23%;">El resultado se guarda en el primer parámetro</td>
  </tr>
  <tr>
    <td style="width: 23%;">Sub</td>
    <td style="width: 23%;">2</td>
    <td style="width: 23%;">Realizar resta</td>
    <td style="width: 23%;">El resultado se guarda en el primer parámetro</td>
  </tr>
  <tr>
    <td style="width: 23%;">mul</td>
    <td style="width: 23%;">1</td>
    <td style="width: 23%;">Realizar multiplicación</td>
    <td style="width: 23%;">Por defecto apunta al registro <i>ax</i>, solo se debe indicar el registro con el que se va a multiplicar <i>ax</i>, el resultado se guarda en <i>ax</i></td>
  </tr>
  <tr>
    <td style="width: 23%;">div</td>
    <td style="width: 23%;">1</td>
    <td style="width: 23%;">Realizar división</td>
    <td style="width: 23%;">Por defecto apunta a <i>ax</i>, el cociente se almacena en <i>al</i> y el residuo en <i>ah</i></td>
  </tr>
  <tr>
    <td style="width: 23%;">Jmp</td>
    <td style="width: 23%;">1</td>
    <td style="width: 23%;">Salto básico</td>
    <td style="width: 23%;">Se indica la etiqueta donde se quiere saltar</td>
  </tr>
  <tr>
    <td style="width: 23%;">Jnn</td>
    <td style="width: 23%;">1</td>
    <td style="width: 23%;">Salto condicional</td>
    <td style="width: 23%;"><i>nn</i> se sustituye por los campos condicionales, <a href="#saltos">ver tabla se saltos</a></td>
  </tr>
  <tr>
    <td style="width: 23%;">Push</td>
    <td style="width: 23%;">1</td>
    <td style="width: 23%;">Insertar en pila</td>
    <td style="width: 23%;">Se indica el registro que se quiere almacenar</td>
  </tr>
  <tr>
    <td style="width: 23%;">Pop</td>
    <td style="width: 23%;">1</td>
    <td style="width: 23%;">Extraer de pila</td>
    <td style="width: 23%;">Se indica el registro donde se quiere guardar el valor a extraer</td>
  </tr>
</table>

#### Macros
Los macros son bloques de códico con funciones específicas que pueden ser llamada, se pueden recibir parámetros a se usados indicandolos con *%*. La sintaxis de forma general corresponde a los siguiente:

    %macro nombre n(número de parámetros)
      Instrucciones
    %endmacro
Por ejemplo un macro para presentar datos por pantalla se puede escribir así:

    %macro print 2 
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, %1
      mov   edx, %2
      int   80h
    %endmacro
En este macro se reciben 2 parámetros que se usan en el orden que se ingresan referenciandolos con *%*
#### Comparador
Para cuando se requiere comparar 2 números se puede usar la directriz *cmp* que indica mediante la manipulación de banderas si los números son iguales, si el primero es mayor o si es menor. La sintaxis a usar corresponde a la directriz seguido de 2 parámetros apuntando hacia los valores, así por ejemplo, se puede tener

    cmp al, bl
    cmp al, 1
Las baderas que son alteradas se pueden observar de mejor manera en la tabla 1.
<table style="width: 100%; text-align: center;" title="Tabla 1">
  <tr>
    <td style="width: 23%;"><b></b></td>
    <td style="width: 23%;"><b>cmp (3, 2)</b></td>
    <td style="width: 23%;"><b>cmp (3, 3)</b></td>
    <td style="width: 23%;"><b>cmp (2, 3)</b></td>
  </tr>
  <tr>
    <td style="width: 23%;">CF (Bandera carry)</td>
   <td style="width: 23%;">0</td> 
   <td style="width: 23%;">0</td>
    <td style="width: 23%;">1</td>
  </tr>
  <tr>
    <td style="width: 23%;">CZ (Bandera cero)</td>
    <td style="width: 23%;">0</td>
    <td style="width: 23%;">1</td>
    <td style="width: 23%;">0</td>
  </tr>
</table>
Estos conceptos son de gran utilidad para la utiliación de saltos, así por ejemplo para saber si un valor es mayor, igual o menor a otro.

#### Etiquetas
Las estiquetas son indicaciones que limitan bloques de codigo como si se tratara de funciones. Se indica el inicio pero no es necesario indicar el fin, sino que cuando se identifica la siguiente etiqueta se da por terminada la anterior. Se declaran indicando el nombre de la etiqueta seguida de dos puntos y a continuación el bloque de código.

    nombreEtiqueta:
      Instrucciones
  
#### Saltos
Punto de un programa informático donde el flujo del programa se ve alterado. Es decir se desplaza a ubicaciones del código indicadas por etiquetas, es decir, se acompaña la instrucción de salto con el nombre de la etiqueta hacia donde se quiere direccionar

    salto etiqueta
    jmp presentar
Algunos de los saltos más comunes corresponden a los que se ve en la tabla 2.
<table style="width: 100%; text-align: center;" title="Tabla 2" id="saltos">
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
    <td style="width: 23%;">jz</td>
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
