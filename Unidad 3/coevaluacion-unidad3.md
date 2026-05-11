# Actividad 03
**Anotaciones de ofApp.h**
````
#pragma once
#include "ofMain.h"
class Node {
public:
	glm::vec2 position;
	Node* next;
	Node(glm::vec2 pos) : position(pos), next(nullptr) {}
};
class LinkedList {
public:
	Node* head; //crea un p
	Node* tail;
	int size;
	LinkedList() : head(nullptr), tail(nullptr), size(0) {}
	~LinkedList() {
		clear();
	}
	void push_back(glm::vec2 pos) { // Esta es la función que añade nuevos nodos, es decir los circulos
		Node* newNode = new Node(pos);
		if (head == nullptr) {
			head = tail = newNode; //En este caso, la cabeza = cola. Es decir, solo hay un circulo o un nuevo nodo (newNode). No es que se añada un nuevo nodo a la cabeza, sino que la cabeza es el nuevo nodo.
		}
		else {
			tail->next = newNode; //En este caso, el nuevo nodo es la cola+ el siguiente. Es decir, se toma el nodo que era la cola y se le añade uno, ese es el nuevo nodo (newNode)
			tail = newNode;
		}
		size++;
	}
	void pop_back() {
		if (head == nullptr)
			return;
		if (head == tail) {
			// Si solo hay un elemento            
			delete head;
			head = tail = nullptr; //como solo queda el nodo de la cola, puesto que solo queda un círculo, la cola se convierte en la cabeza. Y al borrar la cabeza, que es lo unico que existe, se borra todo.
		}
		else {
			Node* temp = head; 
			while (temp->next != tail) { // El puntero se convierte en el siguiente nodo, cuando !=tail, significa que "llego" a una nodo de distancia posición de la cola.
				temp = temp->next; //Avanza al siguiente nodo, es decir, a la cola
			}
			delete tail; 
			tail = temp;
			tail->next = nullptr; // se borra la cola, es decir el ultimo círculo
		}
		size--;
	}
	void clear() { //claramente, el objeto de esta clase es que borra todo
		Node* current = head;
		while (current != nullptr) {
			Node* nextNode = current->next; //el siguiente nodo = nodo actual
			delete current;
			current = nextNode;
		}
		head = tail = nullptr;
		size = 0;
	}
};

class ofApp : public ofBaseApp {
public:
	LinkedList snake;
	float backgroundHue;
	void setup();
	void update();
	void draw();
	void keyPressed(int key);
};
````
