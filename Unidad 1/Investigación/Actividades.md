# Actividad 1

Se realizaron los ejercicios de Fetch-Decode-Execute

![Link Youtube](www.youtube.com)

- uno
- dos
- tres

**negrita**

![alt text](Dayro-moreno-rey-.png)

# Actividad 2
## Experimento (1)
- En laS primeras dos instruccionesse le de a D el valor de 1: @1, D=A; D=1.
- Se selecciona la dirección 2.
- D=D+A; D=1+2, por lo que: D=3
- Luego se selecciona la dirección 16 y el valor del "casillero (M)."
- M=D; M=3 y M es el valor de la dirección 16.
## Experimento (2)
- 
# Actividad 3
## - Identifica una instrucción que use la ALU y explica qué hace.
### - ¿Para qué sirve el registro PC?
El registro PC sirve para seguir hacía el siguiente adress del computador. --- ESTA SE PUEDE MEJORAR
### - ¿Cuál es la diferencia entre @i y @READKEYBOARD?
La @i es un simbolo que representa una dirección de la memoria RAM (si es la primera entonces se le asigna el 16) y es parte del proceso de lectura de una tecla del computador, puesto que despues hay que guardar un valor en ella. @READKEYBOARD no representa ninguna dirección, funciona como un atajo a los pasos anteriormente mencionados.
### - Describe qué se necesita para leer el teclado y mostrar información en la pantalla.
Para leer el teclado hay que ir hasta el adress 24576 (que contiene el teclado) y guardar en un registro D el contenido de este, el cual es igual al número de la tecla.
### - Identifica un bucle en el programa y explica su funcionamiento.
En el programa el bucle empieza en el @READKEYBOARD, puesto que aquí se espera a que se presione una tecla. Si no se presiona tecla, el código sigue hasta el fin donde se encuentra con un 0;JMP que lo reinicia. Por otro lado, si se presiona una tecla, entonces el programa sigue hasta que se suelta esta.
### - Identifica una condición en el programa y explica su funcionamiento.
En D;JNE; se identifica si hay una tecla presionada (D=0) o si no hay ninguna flecha presionada (D!=0), lo cual define si se continua con el código o si se salta a la siguiente linea.
