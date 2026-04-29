# Actividad 1  
```cpp
#include <iostream>
int sum(int a, int b) {
	return a + b;
}

int main() {
	int a = 5;
	int b = 7;
	std::cout << "La suma de " << a << " y " << b << " es " << sum(a, b) << "\n";
}
```
1. ¿Para qué sirven los breakpoints?

Los breakpoints son puntos específicos en los que el código se detiene de manera intencional mientras se está ejecutando. Esto  permite observar con más calma qué está ocurriendo en ese momento, revisar cómo van cambiando los valores y analizar el comportamiento del programa paso a paso. De esta forma, es más sencillo identificar posibles fallas, errores o aspectos que se puedan mejorar en partes concretas del código.

2. ¿Para qué se usa la ventana de depuración Autos?
La ventana de depuración Autos se utiliza para realizar varias funciones durante la ejecución del programa. Cuando el código está corriendo pero se encuentra pausado en un breakpoint, podemos ejecutar las instrucciones una por una, avanzar por partes específicas, omitir ciertos fragmentos o incluso volver al inicio. Todo esto con el propósito de analizar el código por secciones y comprender mejor su funcionamiento.

# Actividad 2

- ¿Qué diferencias observas en el comportamiento de a, b y c tras cada llamada?
El valor de a se modifica dentro de la función. Sin embargo, cuando regresamos a la variable original, vuelve a tener su valor inicial, es decir, el cambio no se conserva fuera de la función. En cambio, en b y en c sí se mantiene el nuevo valor al salir de la función, por lo que la modificación realizada sí queda almacenada.

- ¿Por qué ocurre esta diferencia?
En a, el valor original no cambia porque al entrar a la función se crea una copia de la variable. Esa copia es la que se modifica, pero solo mientras está dentro de la función, por lo que al salir todo vuelve al valor inicial. En b, se utiliza una referencia a la variable original, por lo que cualquier cambio que se haga dentro de la función afecta directamente su valor y se mantiene al salir. En c, se usa un puntero y, mediante el operador de dirección, se accede a la variable original para modificar su contenido, haciendo que el nuevo valor también se conserve fuera de la función.

# Actividad 3

|variables globales y estáticas  | 
|--------------------------------|
|int global_inicializada |
|int global_no_inicializada|
|static int var_estatica |

|Heap | 
|--------------------------------|
|int* arr = new int[tam]|

|stack | 
|--------------------------------|
|int a = 10;|
|int b = 20;|
|int c = suma(a, b);|
|int tamArray = 10;|
|int* arrayHeap = crearArrayHeap(tamArray);|


# Actividad 4

## Experimento 1
Se crea un puntero llamado ptr, el cual almacena la dirección de memoria donde está guardada la función main. A esa dirección se accede mediante &main. luego, se imprime en pantalla el valor almacenado en ptr, es decir, la dirección de memoria obtenida. Finalmente, el programa intenta modificar el contenido que se encuentra en la RAM en esa dirección específica. En este caso, busca sobrescribir lo que corresponde a main, intentando borrar su contenido y colocar un cero en la posición de memoria donde está almacenado.
## Experimento 2
En esta parte del código se crea una variable puntero, pero se declara como char y no como void, como en el ejemplo anterior. Debido a esto, el valor que se muestra en pantalla ya no aparece como una dirección de memoria, sino como caracteres extraños o símbolos sin sentido.
## Experimento 3
En este experimento se declaran dos variables globales, las cuales pueden utilizarse en cualquier parte del código. Primero se muestran con los valores que tienen inicialmente. Después, dentro de la función main, se modifican los valores que contienen y se vuelven a imprimir para observar el cambio. En este caso, simplemente se mostrarán los nuevos valores que quedaron almacenados en estas variables.
## Experimento 4
El código presenta un error que impide mostrar los resultados. La variable está declarada únicamente dentro de una función, por lo que solo existe dentro de ese bloque. Y no es posible usarla en main, porque simplemente no existe. 
Por esta razón no es posible modificarla ni acceder a su valor, lo que provoca que el programa genere errores y no muestre el resultado completo. En este caso, lo correcto sería llamar a la función correspondiente y no intentar acceder directamente a la variable que fue declarada dentro de ella.
## Experimento 5
Se crean dos variables: una estática y otra que no es estática. Luego se implementa un ciclo que incrementa ambas variables de uno en uno hasta completar cinco aumentos. En este caso, la variable estática se va modificando y conserva cada nuevo valor después de cada iteración, por lo que al finalizar el proceso su valor llega a 105. Por otro lado, la variable que no es estática no mantiene los cambios realizados, ya que no conserva la nueva información entre cada ejecución. Por esta razón, no se le suma realmente nada de forma acumulativa y su valor inicial y final permanecen iguales.
## Experimento 6 
Se crea un arreglo y se define una variable local que determina el tamaño del arreglo. Luego se declara el arreglo y se le asigna ese tamaño correspondiente. Después, se inicializa un ciclo que recorre todos los espacios del arreglo; además de recorrerlos, indica en qué posición de memoria está almacenado cada elemento. Finalmente, se elimina la información del arreglo.

# Actividad 5 
1. Explica qué ocurre al copiar un objeto en C++ y en C#. ¿Qué diferencias encuentras?*

En C#, se crea el objeto original y luego se iguala la copia a este. Al modificar la copia, también cambian los valores del original, ya que ambos hacen referencia a la misma información.
En C++, se crea el objeto original y luego una copia independiente. Al modificar la copia, el original mantiene sus valores iniciales, porque se trata de una copia real. Sin embargo, si se usa una referencia al objeto original y se modifican sus valores, entonces sí cambiarán los datos originales.

2. ¿Qué es `copia` en C++ y en C#? ¿Es una copia independiente de `original`?*

En C++, una copia del objeto es independiente del original. Puede tener nuevos valores o características sin afectar al objeto inicial, ya que se crea una copia real con sus propios datos.
En C#, al igualar una copia con el objeto original, ambos comparten la misma información. Aunque parezca un “nuevo objeto”, cualquier cambio que se haga en la copia también modificará los valores del objeto original.


## Actividad integradora
### A. Predicción (sin ejecutar el código):
1. ¿Cuál será la salida final en la consola de este programa?**
```
--- Experimento con paso de parámetros ---
Valor inicial de val_A: 20
-> Dentro de sumaPorValor, 'a' ahora es: 30
Valor final de val_A: 20

Valor inicial de val_B: 20
-> Dentro de sumaPorReferencia, 'a' ahora es: 30
Valor final de val_B: 30

Valor inicial de val_C: 20
-> Dentro de sumaPorPuntero, '*a' ahora es: 30
Valor final de val_C: 30

--- Experimento con variables estáticas ---

-> Llamada a ejecutarContador. Valor de contador_estatico: 1
-> Llamada a ejecutarContador. Valor de contador_estatico: 2
-> Llamada a ejecutarContador. Valor de contador_estatico: 3
```

**2. Escribe la salida completa que esperas.**
La salida final del programa va a mostrar: el valor de a va a ser igual, porque es una suma por valor. El valor b y c si van a cambiar como lo dice la suma, porque son sumas por referencia y por puntero. Por su parte, el contador, al ser estatico va a ir sumando de 1 en 1, es decir, aunque al principio de la función se declare que su valor es 0, como es un valor estatico se va seguir sumando de 1 en 1 y el valor final va a ser 103, ya que el contador se llama tres veces. 

**3. Dibuja un mapa de memoria conceptual de este programa justo antes de que main finalice.** *Debes indicar en qué segmento de 

### B. Compara la salida real con tu predicción:
**1. Si hubo diferencias, explica por qué ocurrieron. Evidencia clave: capturas de pantalla antes y después de los puntos de interés (¿Cuáles son esos puntos? -> tu tarea analizarlo).**
No hubo diferencias. Los puntos clave son cuando **A**, **B** y **C** entran y salen de su respectiva suma, ya que ahí se observa si la variable original cambió o no. La función del contador se llama para verificar si realmente se está incrementando.

**2. Describe qué demuestran estas capturas sobre la diferencia entre los diferentes tipos de paso por parámetros analizados.** 

**3. Explica con tus propias palabras el comportamiento de contador_estatico. ¿Por qué “recuerda” su valor entre llamadas a la función ejecutarContador? ¿En qué se diferencia de una variable local normal?**
Al ser estática, cada vez que se le añaden valores estos se conservan en la variable original. En cambio, si no fuera estática, los valores solo se guardarían dentro de la función mientras se ejecuta y, al salir de ella, el contador volvería a su valor inicial, que en este caso es 0.


