# Actividad 1:
## Parte 1
- **¿Qué es el encapsulamiento para ti? Describe una situación en la que te haya sido útil o donde hayas visto su importancia.**
El encapsulamiento es la forma de controlar cómo se accede a los datos. Hay tres tipos, que son: protegido, se puede usar dentro de su clase y en las clases que heredan de ella; privado, solo se puede usar dentro de la misma clase; y público, se puede usar desde cualquier parte.
- **¿Qué es la herencia? ¿Por qué un programador decidiría usarla? Da un ejemplo simple.**
Permite agrupar distintas clases bajo una sola definición, como por ejemplo, guardar vaca, cerdo y perro en una clase llamada animales.
- **¿Qué es el polimorfismo? Describe con tus palabras qué significa que un código sea “polimórfico”.**
Es la capacidad de que para varias subclases que heredan de una clase particular, la capacidad de de responder de manera diferente al mismo método.
## Parte 2
**Encapsulamiento:**
- **Señala una línea de código que sea un ejemplo claro de encapsulamiento y explica por qué lo es.***
private string nombre;
Es un ejemplo de encapsulamiento porque la variable nombre es un string privado, es decir solo se va a poder modificar en esa misma clase.

get { return nombre; } protected set { nombre = value; }
Esto es encapsulamiento porque no se accede directamente al atributo nombre, sino a través de una propiedad que controla cómo se lee y cómo se modifica.
- **¿Por qué crees que el campo nombre es private pero la propiedad Nombre es public? ¿Qué problema se evita con esto?**
El campo nombre es private para que no se modifique directamente desde cualquier parte del código, evitando errores.
La propiedad, que es una manera de acceder a una variable sin tocarla directamente (en este caso el get set), Nombre es public para permitir el acceso controlado. Es decir, no se puede cambiar el valor libremente, sino que pasa por una "proceso" más seguro.
**Herencia:**
- **¿Cómo se evidencia la herencia en la clase Circulo?**
public class Circulo : Figura
Esta lína quiere decir que la clase Circulo hereda de Figura.
- **Un objeto de tipo Circulo, además de Radio, ¿Qué otros datos almacena en su interior gracias a la herencia?**
Además de Radio, Circulo también almacena Nombre, que viene de la clase Figura.
**Polimorfismo:**
- **Observa el bucle `foreach`. La variable `fig` es de tipo Figura, pero a veces contiene un Circulo y otras un Rectangulo. Cuando se llama a `fig.Dibujar()`, el programa ejecuta la versión correcta. En tu opinión, ¿Cómo crees que funciona esto “por debajo”? No necesitas saber la respuesta correcta, solo quiero que intentes razonar cómo podría ser.**
Supongo que como la clase Dibujar, en realidad no tiene nada en su interior, luego puede llamarse en otras clases como la de Circulo y Rectangulo. Como en este punto la clase Rectangulo y la Circulo ya se han definido como la figura que se eligió respectivamente, entonces al final de la clase se define para que se va a usar Dibujar, si para ser un rectángulo o un círculo.
## Parte 3:
Creo que se almacenarán en uno tras otro a partir de un determinado punto de memoria.

# Actividad 2
## Análisis del código:
La clase Particle crea la partícula y los métodos que luego van a heredar las otras clases para saber si explotará y de qué color van a ser. Además de la posición en la que se inicializan.

**Código ofApp.h**
La clase RisingParticle toma los métodos definidos anteriormente y define la posición inicial y el color de la partícula, así como otros valores importantes, que son el tiempo de vida, etc.

Cada clase que tenga Explosion, va a representar una forma distinta de explosión.

***Depurar → Inspección rápida → &(nombre de variable)***
***Depurar → Ventanas → Memoria 1***

# Actividad 3
- **Hipótesis:** Creo que en la memoria vamos a ver objetos sin valor ***(¿eso es posible?)*** esperando a que cuando se presione con el mouse se le den los valores de x y y. Probablemente los valores sean de 0.
# Actividad 4
## Programa 1
//Actividad4Prueba1
El programa no muestra ninguna información en pantalla, tampoco presenta errores de compilación.
// Actividad4Prueba2
El programa presenta errores de compilación en las líneas 14 y 16 que son ***ac.protectedVar = 20;*** y ***ac.privateVar = 30;*** respectivamente. Lo primero que supongo es que se debe al encapsulamiento, ya que publicVar (en la línea 12) no muestra errores de compilación y su encapsulamiento es público.
***PREGUNTA PARA LA CLASE: si se esta llamando a la clase AccessControl en la línea 11, ¿por qué el protectedVar no sirve?***
--> Si bien el obejto ac esta relacionado a AccessControl, al estar en la clase main no se puede editar, ya que la clase main no es herencia de la clase AccessControl.
El privateVar siempre será un error de compilación porque solo podría usarse en la clase AccessControl.
## Programa 2
// Actividad4Prueba3
Hay un error de compilación porque el secret1 es privado y en el código estan intentando acceder a él desde otra clase.
## Programa 3
// Actividad4Prueba4
El código usa una instrucción llamada reinterpet_cast que le permite acceder a los atributos aunque sean privados. ***preguntar cómo***
Los valores de MyClass entonces reemplazan a los originales (42,3.14f,"A")
# Actividad 5
**Concepto de herencia: la herencia es otro concepto fundamental en la programación orientada a objetos. Observa de nuevo en ofApp.h la clase `CircularExplosion`. Observa que esta clase hereda de la clase `ExplosionParticle` que a su vez hereda de la clase `Particle`.**

**🧐🧪✍️ captura de nuevo la memoria que ocupa el objeto `CircularExplosion` compara la jerarquía de clases con los campos en memoria del objeto. ¿Qué puedes observar? ¿Qué información te proporciona el depurador? ¿Qué puedes concluir?**

**🧐🧪✍️ ¿Cómo se implementa la herencia en C++?**
En C++, la herencia se implementa haciendo que la clase derivada incluya internamente la estructura de la clase base. Es decir, los atributos y métodos de la clase padre pasan a formar parte del objeto hijo.
**🧐🧪✍️ C++ permite hacer algo que C# no: herencia múltiple. Realiza un experimento que te permita ver cómo se objeto en memoria cuya clase base tiene herencia múltiple.**

#
# Actividad 6
