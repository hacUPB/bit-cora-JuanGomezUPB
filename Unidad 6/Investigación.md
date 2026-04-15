refactoring.guru --> Patrones de diseño:

# Actividad 1
**State**: Los estados son comportamientos. Cada estado es una clase State

**virtual** --> clase abstracta: el metodo no se va a utilizar en esa fase sino como una interfaz, sí se implementan en cada subclase.
**Observer** --> son los usuarios que observan, quienes estan suscritos y a quienes se les notifica (notify) si estan suscritos.

**class Particle** --> Solo se declara porque se construte despues.
**class State** --> Patrón de diseño de los diferentes estados --> Esta es una clase abstracta, es decir no se va a implementar, solo sus subclases.

**class Particle : public Observer** --> Hereda de observer
  - ***override*** --> Llamandose igual el método se puede cambiar. Por ejemplo en algunas clases se heredan cosas y se quiere cambiar solo algo en especifico, se usa override.
  - 

ofApp.cpp:
**assObserver:** Se añade el usuario
**nOTIFY:** Se notifica un evento --> **Particle:onNotify:** Dependiendo de que evento, lo notifica, recorre os eventos a ver cualquier es.
**Subject::Notify** --> 

**Experimento:  que no se suscriban todas, se comenta la línea: addObserver(p) [de esa partícula en especifico].**

**respuestas**
1. Se puede interactuar presionando ciertas teclas. La tecla s detiene las particulasd en su sitio, la tecla n es la que los devuelve a su comportamiento original, r las repele de donde esta la flecha y a las lleva hacía donde está la flecha.
2. No, hay tres clases de particulas son distintas, tienen distintos colores y viajan a distinta velocidad.
3. 
4. Cuando se presiona una tecla, se notifica a todas las particulas del evento que acaba de suceder. Una vez llega este evento, las particulas se susciben con el "addObserver", si esta última línea se comenta (o si directamente no existe) entonces no se estará suscribiendo, significa que esas particulas no se verán afectadas por el evento.

# Actividad 2
**Observable** --> La tienda

1. **Identifica los Roles:**
    - ¿Qué clase actúa como la interfaz `Observer`? ¿Qué método define?
La clase Observer actúa como plantilla (que luego heredara particle). Los "virtual" la hacen "invisible", porque el método no se va a utilizar en esa clase.
````
class Observer {
public:
	virtual ~Observer() = default;
	virtual void onNotify(const std::string& event) = 0;
};
````
    - ¿Qué clase actúa como `Subject`? ¿Qué métodos proporciona para gestionar observadores y notificar?
````
class Subject {
public:
	void addObserver(Observer* observer);
	void removeObserver(Observer* observer);
protected:
	void notify(const std::string& event);
private:
	std::vector<Observer*> observers;
};
````

    - ¿Qué clase es el `ConcreteSubject` en esta aplicación? ¿Por qué? (Pista: ¿Quién *envía* las notificaciones?)

    - ¿Qué clase(s) actúan como `ConcreteObserver`? ¿Por qué? (Pista: ¿Quién *recibe* y *reacciona* a las notificaciones?)
class Particle : public Observer {
public:
	Particle();
	~Particle() override;
	Particle(const Particle&) = delete;
	Particle& operator=(const Particle&) = delete;
	void update();  void draw();
	void onNotify(const std::string& event) override;
	void setState(State* newState);
	ofVec2f position;
	ofVec2f velocity;
	float size;
	ofColor color;
private:
	void keepInsideWindow();
	State* state;
};
2. **Sigue el flujo de notificación:**
    - Localiza el método `keyPressed` en `ofApp.cpp`. ¿Qué sucede cuando se presiona la tecla ‘a’? ¿Qué método se llama?
Cuandose presiona la tecla "a", se notifica el "attract", lo cual cambia el estado a AtrractState.
````
void ofApp::keyPressed(int key) {
	switch (key) {
(...)
	case 'a':
		notify("attract");
		break;
(...)
}
````
    - Ve al método `notify` en la clase `Subject`. ¿Qué hace este método?
El método notify recorre los observer y los notifica del nuevo evento, aquellas particulas que no esten en la lista (que no tengan *activo* el addObserver) no serán leídas puesto que no están en la lista.
    - Localiza el método que implementa la interfaz `Observer` en la clase `Particle` (`onNotify`). ¿Qué hace este método cuando recibe el evento “attract”?
````
void Particle::onNotify(const std::string& event) {
	if (event == "attract") {
		setState(new AttractState());
````
Cuando este método recibe el attract, cambia (instancia*) el estado a Attract State. Este evento se llama "attract". 
3. **Registro y eliminación de observadores:**
    - ¿En qué parte del código se añaden las instancias de `Particle` como observadores de `ofApp`? (Busca dónde se llama a `addObserver`).
````
void ofApp::setup() {
	ofBackground(0);
	particles.reserve(100 + 5 + 10);
	for (int i = 0; i < 100; ++i) {
		Particle* p = ParticleFactory::createParticle("star");
		particles.push_back(p);
		addObserver(p);
	}
	for (int i = 0; i < 5; ++i) {
		Particle* p = ParticleFactory::createParticle("shooting_star");
		particles.push_back(p);
		addObserver(p);
	}
	for (int i = 0; i < 10; ++i) {
		Particle* p = ParticleFactory::createParticle("planet");
		particles.push_back(p);
		//addObserver(p);
````
    - Aunque no se usa explícitamente en este ejemplo simple, ¿Dónde se eliminarían los observadores si fuera necesario (por ejemplo, si una partícula se destruyera durante la ejecución)? (Busca `removeObserver`). ¿Por qué es importante el destructor de `ofApp` en este contexto?
````
ofApp::~ofApp() {
	for (Particle* p : particles) {
		removeObserver(p);
		delete p;
	}
	particles.clear();
````
Acá se llama a removeObserver. Cuando se llama se borrá la particula (delete p;).

# Actividad 3
1. **Identifica la Factory:**
    - ¿Qué clase actúa como la factory en este ejemplo?
````
class ParticleFactory {
public:
	static Particle* createParticle(const std::string& type);
};
````
Se llama la clase ParticleFactory, que creará un método que retornará un puntero tipo Particle, en el SetUp cuando se llame se le asignará un nombre por el tipo de partícula que se este creando.
    - ¿Cuál es el “método factory” específico? ¿Es un método de instancia o estático?
El método es CreateParticle y es estático.
    - ¿Qué tipo de objeto devuelve este método fábrica?
Un puntero del tipo Particle.
2. **Proceso de creación:**
    - Observa el método `ParticleFactory::createParticle`. ¿Cómo decide qué tipo de partícula específica crear y configurar?
````
void ofApp::setup() {
	ofBackground(0);
	particles.reserve(100 + 5 + 10);
	for (int i = 0; i < 100; ++i) {
		Particle* p = ParticleFactory::createParticle("star");
		particles.push_back(p);
		addObserver(p);
````
En el setUp, con la cadena de caracteres asignada al nombre de la partícula, en este caso "star" se estara enviando información del tipo partícula que se creará. Esto lleva a la siguiente función:
````
Particle* ParticleFactory::createParticle(const std::string& type) {
	Particle* particle = new Particle();
	if (type == "star") {
		particle->size = ofRandom(2.0f, 4.0f);
		particle->color = ofColor(255, 0, 0);
````
    - ¿Qué información necesita el método fábrica para realizar su trabajo?
Solo necesita la cadena de caracteres que define el tipo de partícula.
    - ¿Qué devuelve si se le pasa un tipo desconocido? ¿Cómo podrías mejorar esto?
Se añadiran las partículas desconocidas pero sin tamaño y color asignados, sino con un color y tamaño predeterminado.
3. **Uso de Factory:**
    - Localiza `ofApp::setup`. ¿Cómo se utiliza la `ParticleFactory` para poblar el vector `particles`?
````
for (int i = 0; i < 100; ++i) {
	Particle* p = ParticleFactory::createParticle("star");
````
Con el for, va a recorrer n cantidad de veces la función que se está llamndo. En el caso de star, 100 veces. Cada vez que pase va a crear una partícula nueva, en este caso, 100.
    - Compara esto con la alternativa: ¿Cómo se vería `ofApp::setup` si *no* usara la fábrica y tuviera que crear y configurar cada tipo de partícula (`star`, `shooting_star`, `planet`) directamente usando `new Particle()` y luego ajustando sus propiedades (`size`, `color`, `velocity`)?
Reporta en tu bitácora
1. Explica con tus propias palabras el propósito del patrón Factory Method (o Simple Factory, en este caso). ¿Qué problema principal aborda en la creación de objetos?
2. ¿Qué ventajas aporta el uso de ParticleFactory en ofApp::setup en comparación con instanciar y configurar las partículas directamente allí? Piensa en términos de organización del código (SRP - Single Responsibility Principle), legibilidad y facilidad para añadir nuevos tipos de partículas en el futuro.
3. Imagina que quieres añadir un nuevo tipo de partícula llamada "black_hole" que tiene tamaño grande, color negro y velocidad muy lenta. Describe los pasos que necesitarías seguir para implementar esto utilizando la ParticleFactory existente. ¿Tendrías que modificar ofApp::setup? ¿Por qué sí o por qué no?
4. El método createParticle en el ejemplo es estático. ¿Qué implicaciones (ventajas/desventajas) tiene esto comparado con tener una instancia de ParticleFactory y un método de instancia createParticle()?.

# Actividad 4
1. **Identifica los componentes:**
    - ¿Cuál es la clase `Context`? ¿Qué miembro utiliza para mantener el estado actual?
La clase Context es Particle, ya que mantiene una referencia al estado actual mediante el atributo State * state, delega su comportamiento al estado en el método update() y permite cambiar de estado mediante setState(). **Revisar esto**
    - ¿Cuál es la interfaz `State`? ¿Qué métodos importantes define? (Piensa en `update`, `onEnter`, `onExit`).
````
class State {
public:  
		virtual ~State() = default;  
		virtual void update(Particle * particle) = 0;  
		virtual void onEnter(Particle * particle) { }  
		virtual void onExit(Particle * particle) { }
		};
````
    - Enumera las clases `ConcreteState`. ¿Qué comportamiento específico encapsula cada una?
````
class NormalState : public State {
public:
	void update(Particle* particle) override;
	void onEnter(Particle* particle) override;
};

class AttractState : public State {
public:
	void update(Particle* particle) override;
};

class RepelState : public State {
public:
	void update(Particle* particle) override;
};

class StopState : public State {
public:
	void update(Particle* particle) override;
````
Cada clase representa los distintos eventos que suceden cuando se presiona una tecla específica. En este caso: "s", "a", "r" o "n", respectivamente. Los métodos que fueron creados en la clase base State, ahora se "sobrescriben" por los update de cada clase. En otras palabras cuando se toca una tecla el estado que esta relacionado con dicha tecla se actuaiza. El método onEnter solo funciona con el estado normal, puesto que es el estado en el que inicia.
2. **Delegación del comportamiento:**
    - Observa el método `Particle::update()`. ¿Cómo delega la lógica de actualización al estado actual?
````
void Particle::update() {
	if (state) {
		state->update(this);
	}
````
El this es la particula que ya esta "seleccionada" y el update quiere decir que se actualiza al estado de esa partícula.
    - Compara el código dentro de `NormalState::update()`, `AttractState::update()`, `RepelState::update()` y `StopState::update()`. ¿Cómo encapsula cada clase un comportamiento diferente?
- NormalState::update()
````
particle->position += particle->velocity;
````
Se suma la posición y velocidad y el movimiento de la particula es "libre."

- AttractState::update()
````
steer(particle, mouse, 0.05f, 3.0f, 0.2f);
````
Calcula dirección hacia el mouse y acelera en esa dirección

RepelState::update()
````
ofVec2f away = particle->position - mouse;
particle->velocity += away * 0.05f;
````
Calcula dirección opuesta al mouse y se aleja de él (position-mouse)
````
StopState::update()
particle->velocity *= 0.80f;
````
Reduce la velocidad poco a poco hasta que se detiene por completo.

3. **Transiciones de estado:**
    - ¿Cómo cambia una `Particle` de un estado a otro? ¿Qué método es responsable de gestionar la transición? (Busca `setState`).
````
	void setState(State* newState);
````
setState crea un nuevo estado para particle cuando recibe un estado nuevo. Ese estado llega de onNotify cuando sucede un evento, es decir se presiona una tecla:
````
void Particle::onNotify(const std::string& event) {
	if (event == "attract") {
		setState(new AttractState());
	}
	else if (event == "repel") {
		setState(new RepelState());
	}
	else if (event == "stop") {
		setState(new StopState());
	}
	else if (event == "normal") {
		setState(new NormalState());
	}
}
````
- ¿Qué sucede dentro de `Particle::setState()`? ¿Por qué son importantes los métodos `onEnter` y `onExit` de la interfaz `State` (aunque no todos los estados concretos los usen extensivamente en este ejemplo)? ¿Qué gestionan `onEnter` y `onExit` en `NormalState`?
````
void Particle::setState(State* newState) {
	if (state) {
		state->onExit(this);
		delete state;
	}
	state = newState;
	if (state) {
		state->onEnter(this);
	}
}
````
Dentro de "Particle::SetState" cuando se llama al método onEnter u onExit significa que se está entrando a un estado o saliendo de este respectivamente. Es decir, si se presiona la tecla especifica de un estado, el método onEnter hace que entre a un estado, mientras que el método onExit (cuando se presione otra tecla) va a eliminar el estado.
    - ¿Qué evento externo (mediado por el patrón Observer, que ya analizaste) desencadena la llamada a `setState` en una `Particle`?
Cuando se presiona una tecla (onNotify)*revisar este*
