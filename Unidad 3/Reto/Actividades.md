# Actividad 6

**1. ¿Cuál es la diferencia entre un constructor y un destructor en C++?**
El constructor se ejecuta al crear el objeto y se encarga de inicializar sus valores (por ejemplo, asignar 10 y 20); funciona como una base. El destructor se ejecuta cuando el objeto deja de existir y se encarga de limpiar o liberar la información utilizada.

**2. ¿Cuál es la diferencia entre un objeto y una clase en C++?**
La clase es el molde o plantilla que define qué datos y acciones tendrá algo. El objeto es quien realmente guarda los datos y ocupa espacio en memoria

**3. ¿Qué diferencia notas entre el objeto Punto en C++ y C#?**
En C++, al escribir Punto p(10, 20) el objeto se crea directamente. En C#, es necesario usar new, puesto que sin eso, la variable no apunta a ningún objeto.

**4. ¿Qué es `p` en C++ y qué es `p` en C#? (en uno de ellos `p` es un objeto y en el otro es una referencia a un objeto).**
En C++, p es el objeto en sí, contiene directamente los datos. En C#, p es una referencia, es decir, guarda la dirección donde está el objeto real.

**5. ¿En qué parte de memoria se almacena `p` en C++ y en C#?**
En C++, p se almacena en el Stack. En C#, la variable p está en el Stack, pero el objeto se encuentra en el Heap.

**6. ¿Qué observaste con el depurador acerca de `p`? Según lo que observaste ¿Qué es un objeto en C++?**
En C++, Es un bloque de memoria el que guarda directamente los valores (como x e y). Esto muestra que un objeto en C++ es, básicamente, un espacio de memoria con un tamaño definido que almacena datos.

# Actividad 8

**1. ¿Qué ocurre después de llamar a la función `cambiarNombre`? ¿Por qué aparece el mensaje `Destructor: Punto cambiado(70, 80) destruido.`?**
En este caso, la función cambiarNombre trabaja por paso por valor, lo que significa que se crea una copia del dato. El cambio solo ocurre dentro de la función y afecta únicamente a esa copia. Al salir de la función, esa copia deja de existir y se llama al destructor para eliminarla, mientras que el dato original permanece sin modificaciones.

**2. ¿Por qué `original` sigue existiendo luego de llamar `cambiarNombre`?**
Como ya dijimos anteriormente, en C++ los objetos deben eliminarse manualmente, por lo que Original se mantiene en el código porque ningún momento fue destruida, por lo que cuando se salga de la función cambiar nombre el objeto volverá a su estado original.

**3. ¿En qué parte del mapa de memoria se encuentra `original` y en qué parte se encuentra `p`? ¿Son el mismo objeto? (recuerda usar siempre el depurador para responder estas preguntas).**
Tanto original como p se encuentran en el Stack, pero en direcciones de memoria diferentes. original está en el espacio de memoria correspondiente a main, mientras que p pertenece al espacio de la función cambiarNombre. Por lo tanto, no son el mismo objeto, sino instancias distintas ubicadas en lugares distintos de la memoria.

**Modifica la función `cambiarNombre`:**

**`void cambiarNombre(Punto& p, string nuevoNombre) {  p.name = nuevoNombre;}`**

**1. ¿Qué ocurre ahora? ¿Por qué?**
Al añadir & se cambia lo anterior: deja de ser paso por valor y pasa a ser paso por referencia. Esto significa que ya no se trabaja con una copia, sino directamente con la variable original. Por lo tanto, cualquier modificación que se haga afectará al valor original, ya que se está haciendo una referencia directa a esa misma variable.


**Modifica ahora a cambiarNombre y a main de la siguiente manera:**

**1. ¿Qué ocurre ahora? ¿Por qué?**
Como es un paso por puntero. Se utiliza la dirección de memoria donde está guardada la variable original y se modifican directamente los valores almacenados allí. Por esta razón, el cambio se realiza directamente sobre la variable original.

**2. En este caso ¿Cuál es la diferencia entre pasar un objeto por valor, por referencia y por puntero?**
En el paso por valor (Punto p) se crea una copia independiente del objeto. Los cambios realizados dentro de la función solo afectan a esa copia y, al salir, esta se destruye. El objeto original no sufre ninguna modificación.
En el paso por referencia (Punto& p) no se crea ninguna copia. La función trabaja directamente con el objeto original, ya que la referencia actúa como un alias. Por eso, cualquier cambio realizado sí afecta al original.
En el paso por puntero (Punto* p) se envía la dirección de memoria del objeto. A través de esa dirección se modifican directamente los valores almacenados, por lo que los cambios también se reflejan en el objeto original.

# Actividad 9

**1. ¿Qué puedes concluir de los miembros estáticos y de instancia de una clase en C++? ¿Cómo se gestionan en memoria? ¿Qué ventajas y desventajas tienen? ¿Cuándo es útil utilizarlos?**
Los miembros estáticos son útiles cuando se necesita que una variable conserve y acumule los cambios, como en el caso de un contador. Su ventaja es que mantienen la información entre ejecuciones, pero su desventaja es que no vuelven automáticamente a su valor original. En cambio, las variables no estáticas vuelven a su estado inicial al salir de la función. Esto es útil cuando se quiere trabajar con el mismo valor base cada vez, aunque no permiten conservar cambios anteriores.


**2. En el programa, en qué segmento de memoria se están almacenando c1, c2, c3 y Contador::total? Ten especial cuidado con la respuesta que das para el caso de c3, piensa de nuevo, qué es c3 y qué está almacenando. Ahora, responde de nuevo, en qué segmento de la memoria se está almacenando c3 y en qué segmento de la memoria se está almacenando el objeto al que apunta c3.**
Los objetos *c1* y *c2*, junto con el puntero *c3*, se almacenan en el Stack porque son variables locales de `main`. Sin embargo, el objeto con valor 15 al que apunta *c3* se guarda en el Heap, ya que fue creado con `new`.
Por su parte, el miembro estático *Contador::total* se encuentra en el Segmento de Datos (memoria estática). Por eso no desaparece ni se duplica con cada objeto creado, sino que permanece en una única ubicación fija accesible para todas las instancias.

# Actividad 10

**1. Explica el ciclo de vida de un objeto en el stack versus uno en el heap.**
Un objeto creado en el Stack se construye, se le asignan sus valores y, cuando deja de estar en su ámbito, se destruye automáticamente, liberando la memoria que ocupaba. En cambio, un objeto creado en el Heap también se construye y realiza sus acciones, pero solo se elimina cuando se indica explícitamente. Es decir, debe borrarse manualmente; si no se hace, seguirá ocupando memoria.

**Ahora realiza la siguiente modificación:**

**1. ¿Compila? ¿Por qué ocurre esto?**
No es posible compilar porque aparece un error ya que la variable pBloque2 fue declarada dentro de unos corchetes, por lo que solo existe en ese bloque. Al intentar usarla fuera de ese espacio, el programa no la reconoce, ya que en ese contexto la variable no existe. Por eso no es posible utilizarla allí.


**2. Modifica el programa para declarar `pBloque2` por fuera del bloque, pero inicializarlo dentro del bloque. ¿Qué ocurre? ¿Por qué?**
En este caso sí es posible utilizarla tanto dentro como fuera de los corchetes, porque la variable fue declarada fuera de ese bloque. Al estar declarada en un ámbito más externo, puede ser accedida y utilizada desde ambos lugares sin problema.

**En este caso:**

**1. ¿Por qué el objeto `pBloque` se destruye al salir del bloque y `pBloque2` no? Recuerda de nuevo, `pBloque2` es un objeto o es una referencia a un objeto?**
El objeto pBloque está almacenado en el Stack, por lo que cumple su función y, cuando sale de su ámbito, se destruye automáticamente liberando su memoria. En cambio, pBloque2 fue creado con *new* y está declarado como Punto*, por lo que es un puntero que apunta a un objeto en el Heap, no el objeto directamente. Esto implica que debe eliminarse manualmente; de lo contrario, no se borrará automáticamente.


**2. ¿En qué parte de la memoria se almacena `pBloque2`?**
Está almacenado en el stack, puesyo que es una variable local que sirve como puntero.

**3. ¿En qué parte de la memoria se almacena el objeto al que apunta `pBloque2`?**
El valor al que se está haciendo referencia, es decir, el objeto creado con new Punto, se almacena en el Heap. Por esta razón no se borra automáticamente al salir del bloque; permanecerá en memoria hasta que se elimine de forma manual.


# Actividad integradora
**¿Cuál es el error?** En la clase personaje a la variable estadisticas se le asigna una referenciacion a un arreglo, que se crea utilizando new, por lo que esta se almacena en el heap y nunca es borrada, aunque el objeto heroe se borre, estadísticas debe ser borrada manualmente

**¿Por qué ocurre? Explica el mecanismo a nivel de memoria (stack, heap, punteros)**
Cuando el objeto heroe se crea dentro de la función simularEncuentro, la variable estadisticas (un puntero en el Stack) guarda la dirección de un bloque de memoria en el Heap. POr esto debe existir una función delete que borre la informacion dentro de estadisticas

**¿Cuál es su consecuencia?**
La informacion almacenada nunca se borra y continua ocupando espacio en la memoria

**¿Cuál es el error?** Al crear la copia no se está haciendo una referenciacion o paso por puntero, la copia apunta a el mismo lugar de memoria que la original

**¿Por qué ocurre? Explica el mecanismo a nivel de memoria (stack, heap, punteros)**
esto provoca que no haya una diferenciacion entre la copia y la original por lo que una modoficacion en cualquiera de los dos afectará la informacion de la original, no es una copia real 

**¿Cuál es su consecuencia?**
Si se modifica una se modificarán las dos, y si se borra una se borrarán las dos, por lo que no tendría sentido crear una copia que no está haciendo nada.