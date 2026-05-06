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

1. ¿Qué es el contexto OpenGL?
   Es el entorno donde se guarda todo el estado gráfico: 
3. ¿Cuál es el rol de la biblioteca GLFW y qué ventaja tiene usarla?
   La biblioteca GLFW permite crear varias  bibiliotecas y contextos. OpenGL necesita un "taller" (como la analogía del taller de arte) donde trabajar, ahí entra en juego la biblioteca GLFW.
5. ¿Por qué crees que OpenGL necesita un contexto (recuerda la analogía del taller de arte)?
   OpenGL necesita un contexto en el cual pueda trabajar. 
7. ¿En últimas qué será el framebuffer y a qué te recuerda de las dos primeras unidades del curso?
   El framebuffer es similar a las dos primeras unidades en esos espacios de memoria de 16 bits *revisar bien los números de estos espacios y los nombres* que al llenarse (-1 o 1) se volvian negros esaparte de la pantalla. *(cambiar esta respuesta)*
9. ¿Qué relación entre en el viewport y el framebuffer?
    El viewport define que parte del framebuffer se usara para dibujar, este tamaño suele coincidir con el tamaño completo del framebuffer.
11. ¿En todo la analizado hasta ahora qué rol juega los drivers de la GPU y la GPU misma?
    
13. ¿Por qué crees que sea necesario activar el VSync? ¿Si no lo activas y la imagen es estática qué crees que pase, y si es dinámica?
    
15. En esta unidad estamos usando OpenGL moderno, pero ¿Qué es OpenGL Legacy? ¿Qué diferencias hay entre ambos?
    
17. ¿Qué es el shader program? ¿Por qué es importante en OpenGL moderno?
    
19. Trata de revisar el código setupTriangle(), intuitivamente ¿Qué crees que hace? ¿Qué crees que es el VAO y el VBO?
    
21. En el ciclo principal (game loop) de OpenGL, notaste que en cada frame (cuadro) le decimos a openGL que use el shader program y el VAO. Si le indicas esto antes del game loop ¿Será necesario seguirlo haciendo en cada loop? Si no es necesario ¿En qué casos crees que esto puede ser útil?
    
23. Finalmente, recuerda lo que hace glfwSwapBuffers(mainWindow); ¿Por qué crees que es importante? ¿Qué pasaría si no lo llamas? ¿Cómo explicas lo que pasa si no lo llamas? (experimenta)
