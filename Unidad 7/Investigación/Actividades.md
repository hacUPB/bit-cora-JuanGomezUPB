# Actividad 1
1. 
![alt text](<../Imágenes/Captura de pantalla 2026-04-27 102230.png>)
2. 
3. 
- ¿Qué es GLFW?
  **R/:** biblioteca que permite crear varias ventanas y contextos. *Actividad 3*
- ¿Qué es un shader?
  **R/:**  pequeños programas que definen cómo transformar esos datos en píxeles. *Actividad 3*
- ¿Qué es un VAO y un VBO? ¿qué significa que sirvan de ID?
- ¿Qué es GLAD?
  **R/:** GLAD es una biblioteca que se encarga de cargar las funciones de OpenGL y hacerlas accesibles en tu programa. Sin esta línea, no podrías usar las funciones de OpenGL. *Actividad 3*

# Actividad 2
Intro

Hicimos el proceso

No funciono porque había un error con el linker

Algo que anotar, es que una vez añadí todo tuve un error con el Linker (vinculador) y el main. Este error se dio porque no había pegado el código del triangle. El que pide al principio del enunciado. No había ni siquiera un main que correr, por eso mostraba el error.

# Actividad 3
**Notas**
- OpenGL--> es una Interfaz: un conjunto de funciones que usas para enviar instrucciones a la GPU. --> Es decir, **NO** dibuja directamente --> Traduce comandos que la GPU ejecuta.
- GLFW: biblioteca que permite crear varias ventanas y contextos.
- Contexto de OpenGL: entorno donde se guarda todo el estasdop gráfico.
- Framebuffer: Porción de memoria donde OpenGL dibuja los píxeles antes de enviarlos a la pantalla --> "Hoja invisible" donde OpenGL pinta cada imagen cuadro a cuadro.
- Viewport: El viewport define qué parte del framebuffer se usará para dibujar. Se mide en píxeles y normalmente coincide con el tamaño completo del framebuffer.


**¿Qué pasa si cambias el primer parámetro de glDrawArrays a GL_LINES? ¿Qué pasa si lo cambias a GL_POINTS? ¿Qué pasa si cambias el tercer parámetro a 2? ¿Qué pasa si lo cambias a 4?
En esta unidad no profundizaremos en los tipos de primitivas, pero es importante que entiendas que OpenGL puede dibujar diferentes tipos de primitivas (triángulos, líneas, puntos, etc.).** *hacer esto rápido een clase*

**1. ¿Qué es el contexto OpenGL?**

   Es el entorno donde se guarda todo el estado gráfico: 
**2. ¿Cuál es el rol de la biblioteca GLFW y qué ventaja tiene usarla?**

   La biblioteca GLFW permite crear varias  bibiliotecas y contextos. OpenGL necesita un "taller" (como la analogía del taller de arte) donde trabajar, ahí entra en juego la biblioteca GLFW.
**3 ¿Por qué crees que OpenGL necesita un contexto (recuerda la analogía del taller de arte)?**

   OpenGL necesita un contexto en el cual pueda trabajar. 
**4. ¿En últimas qué será el framebuffer y a qué te recuerda de las dos primeras unidades del curso?**

   El framebuffer es similar a las dos primeras unidades en esos espacios de memoria de 16 bits *revisar bien los números de estos espacios y los nombres* que al llenarse (-1 o 1) se volvian negros esaparte de la pantalla. *(cambiar esta respuesta)*
**5. ¿Qué relación entre en el viewport y el framebuffer?**

    El viewport define que parte del framebuffer se usara para dibujar, este tamaño suele coincidir con el tamaño completo del framebuffer.
**6. ¿En todo la analizado hasta ahora qué rol juega los drivers de la GPU y la GPU misma?**
    
**7. ¿Por qué crees que sea necesario activar el VSync? ¿Si no lo activas y la imagen es estática qué crees que pase, y si es dinámica?**
    
**8. En esta unidad estamos usando OpenGL moderno, pero ¿Qué es OpenGL Legacy? ¿Qué diferencias hay entre ambos?**
    
**9. ¿Qué es el shader program? ¿Por qué es importante en OpenGL moderno?**
    
**10. Trata de revisar el código setupTriangle(), intuitivamente ¿Qué crees que hace? ¿Qué crees que es el VAO y el VBO?**
    
**11. En el ciclo principal (game loop) de OpenGL, notaste que en cada frame (cuadro) le decimos a openGL que use el shader program y el VAO. Si le indicas esto antes del game loop ¿Será necesario seguirlo haciendo en cada loop? Si no es necesario ¿En qué casos crees que esto puede ser útil?**
    
**12. Finalmente, recuerda lo que hace glfwSwapBuffers(mainWindow); ¿Por qué crees que es importante? ¿Qué pasaría si no lo llamas? ¿Cómo explicas lo que pasa si no lo llamas? (experimenta)**

# Actividad 4
**--> YOUTUBE: MIKE SHAH**
--> Notebooklm.google.com --> Para tomar notas


- ***Pipeliene:***
    - Vertex Shading --> Rasterization --> Fragment shading


Luego de estudiar las unidades 1 y 2 de este curso y ver el video, escribe con tus propias palabras ¿Cuál es la diferencia entre una CPU y una GPU?

La CPU puede realizar acciones secuencialmente. Es decir una tras otra. La GPU va a poder realizar acciones en simultaneo. Como en el ejemplo de Mythbusters, la CPU dibujaría algo punto por punto, mientras que la GPu tiene la capacidad de hacer un dibujo mucha más detallado al insante, poniendo varios puntos en simultaneo.

**1. ¿Cuáles son los tres pasos claves del pipeline de OpenGL? Explica en tus propias palabras cuál es el objetivo de cada paso.**

PIPELINE: Vertex Shading --> Rasterization --> Fragment shading

**2. La gran novedad que introduce OpenGL moderno es el pipeline programable. ¿Qué significa esto? ¿Qué diferencia hay entre el pipeline fijo y el programable? ¿Qué ventajas le ves a esto? y si el pipeline es programable, ¿Qué tengo que programar?**



**3. Si fueras a describir el proceso de rasterización ¿Qué dirías?**

QuSe define que pixeles estan contenidos dentro de un triangulo en la pantalla. Luego, este "fragmento" se pinta del color del mismo.

**4. ¿Qué son los fragmentos? ¿Es lo mismo un fragmento que un pixel? ¿Por qué?**

No, un fragmento es un triangulo y esta compuesto por los varios pixeles que funiconan como "relleno" del mismo triangulo.

**5. Explica qué problema resuelve el Z-buffer y ¿Qué es el depth test?**

El z buffer corresponde a la distancia de los vertices con la camara. Los objetos más cercanos se sobreponen a los más lejanos. Los vertices más lejanos que esten "cubiertos" por los más cercanos desaparecen.

**6. ¿Por qué se presenta el problema de la aliasing? ¿Qué es el anti-aliasing?**

Cuando las líneas de un triangulo pasan por el medio de un pixel, y teniendo en cuenta que por el proceso de rasterización todos los pixeles se colorean, es posible que el fragmento quede con bordes pixelados; a esto se le llama aliasing. EL anti-aliasing, diseñado para contrarrestar este efecto, consiste en dividir cada pixel en 16 partes, dependiendo de donde corte el triangulo, el pizel se pintara con una sombra más clara u oscura, de esta manaera, los bordes son más suaves y no se nota tanto el efecto del aliasing. 

**7. ¿Qué relación hay entre la iluminación y el fragment shader? Siempre es necesario tener en cuenta la iluminación en un fragment shader? o puedo hacer un fragment shader sin iluminación? Explica que implicaciones tiene esto.**

El fragment shader tiene una relación directa con la iluminación. Dependiendo de si el fragmento esta mirando directamente a la luz o si es perpendicular a ella será completamente claro u oscuro respectivamente. Es decir, no se puede definir la sombra de un objeto sin saber de donde proviene la luz o si no hay fuente de luz.

**8. ¿Qué implica para la GPU que una aplicación tenga múltiples fuentes de iluminación?**

Para una GPU, que haya multiples fuetes de iluminación significa más calculos que hacer para cada fragmento. Para cada fuente de luz, hay que hacer un calculo propio. Por eso se limita el rango de influencia de las luces, para que no se den¿ba hacer un calculo de cada luz en el ambiente.

***Notas***
- **buffer:** espacio de almacenamiento temporal en la memoria física (RAM)
- **Objetos en OpenGL:**  Entidades que represewntan recursos gráficos --> texturas, buffers de vertices, shaders, etc. *Son gestionados por la GPU*
- Cada objeto tiene un identificador unico (ID) para que pueda ser referenciado.
-**Contexto de OpenGL** == objeto
- **VAO:** *objeto de OpenGL* que contiene los *atributos* de los vertices
- **VBO:** *objeto de OpenGL* que contiene los *datos* de los vertices.
- Los atributos de vértice son propiedades que describen cada vértice en un buffer de vértices. Estos atributos pueden incluir información como la posición, el color, las coordenadas de textura y las normales. Cada atributo tiene un índice único que se utiliza para referenciarlo en el shader. 
- **NDC *(Coordenadas de disposisitvo normalizadas)*:** Se utiliza **en este caso**, *es decir no quiere decir que así sea en todos los caosos*, las coordenas van de -1 a 1 y así sabemos como definir los valores de los vertices.
- En OpenGL moderno es obligatorio usar shaders. 

**1. Escribe un resumen en tus propias palabras de lo que se necesita para dibujar un triángulo en OpenGL.**
Para poder dibujar un triangulo en OpenGL hay que tener un objeto, que en este caso es el contexto. Además necesitamos un VAO y un VBO que es donde se guardaron los datos y los atributos de los vertices respectivamente. Estos ultimos, los atributos, contienen la información necesaria para crear el triangulo, en este caso, la posición.
**2. Escribe un resumen en tus propias palabras de lo que necesitas para poder usar un shader en OpenGL.**

**Volvamos al asunto del `glVertexAttribPointer` ¿Recuerdas? Te prometí que lo retomaríamos. Pero ahora que ya sabes un poco más de OpenGL, te voy a proponer algo más. Supón que vas a definir un VBO con tres atributos y la idea es usar un shader diferente en cada draw call. Por ejemplo, el primer shader va a usar la posición, el segundo shader va a usar el color y el tercer shader va a usar el offset.**
