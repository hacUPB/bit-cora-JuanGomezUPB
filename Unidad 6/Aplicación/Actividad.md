# Actividad 5
**En esta actividad modificarás el caso de estudio para añadir un nuevo tipo de partícula que utiliza los patrones Observer, Factory y State.**

1. El código fuente completo de tu proyecto openFrameworks.
   
*Fragmentos que modifiqué*
````.cpp
	else if (type == "brasil") {
		particle->size = ofRandom(20.0f, 2.0f);
		particle->color = ofColor(0, 70, 0);
	}
````
````.cpp
	for (int i = 0; i < 10; ++i) {
		Particle* p = ParticleFactory::createParticle("brasil");
		particles.push_back(p);
		addObserver(p);
	}
````
2. Explica cómo usaste el patrón Factory para esta nueva partícula.
 
En ParticleFactory se define el color y tamaño de la nueva particula, para luego en el setup añadirse como observador.

3. Describe cómo implementaste el patrón Observer para esta nueva partícula.
 
Ya que Particle hereda de de la clase observer, al crear una nueva particula ("brasil" en este caso), se heredan varias variables de la clas base "Observer". Es decir hace parte del patrón observer.

4. Explica cómo aplicaste el patrón State a esta nueva partícula.

El patrón State no juega un papel en la creación de la partícula, al menos no exclusivamente en ella. Funciona como con todas las particulas, definiendo su estado como "NormalState" al iniciarse (OnEnter) y cada vez que ocurra un evento.

![alt text](<../Imágenes/Particula nueva.png>)