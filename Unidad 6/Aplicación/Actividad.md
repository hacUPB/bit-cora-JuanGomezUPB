# Actividad 5
**En esta actividad modificarás el caso de estudio para añadir un nuevo tipo de partícula que utiliza los patrones Observer, Factory y State.**

1. El código fuente completo de tu proyecto openFrameworks.
   
**Fragmentos que modifiqué**
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
Se utiliza el setup para crear la nueva partícula 
3. Describe cómo implementaste el patrón Observer para esta nueva partícula.
Ya que Particle hereda de de la clase observer, al crear una nueva particula ("brasil" en este caso), se heredan varias variables de la clas base "Observer". Es decir hace parte del patrón observer.

5. Explica cómo aplicaste el patrón State a esta nueva partícula.
