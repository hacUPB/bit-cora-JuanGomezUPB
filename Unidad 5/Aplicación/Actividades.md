# Actividad 7
**A.** 
1. Para la primera partícula cree una partícula que en vez de caer, subiera. Para esto me base en el código ya existente de risingParticle, esta nueva partícula la nombre FallingParticle cuando presiono F.

class FallingParticle : public Particle {
private:
    glm::vec2 position;
    glm::vec2 velocity;
    float gravity;
    ofColor color;

public:
    FallingParticle(const glm::vec2& pos)
        : position(pos),
          velocity(ofRandom(-50, 50), ofRandom(50, 150)), // leve movimiento horizontal + caída inicial
          gravity(400.0f),
          color(ofColor::orange) {}

    void update(float dt) override {
        // Aplicar gravedad
        velocity.y += gravity * dt;

        // Actualizar posición
        position += velocity * dt;
    }

    void draw() override {
        ofSetColor(color);
        ofDrawCircle(position, 6);
    }

    bool isDead() const override {
        // Muere cuando sale por abajo de la pantalla
        return position.y > ofGetHeight();
    }
};

2. La siguiente fue FlyingParticle, es decir una partícula que no fuera afectada por la gravedad. Esta fue sencilla, puesto que solo había que borrar la línea que afectaba a la gravedad:
velocity.y += 9.8f * dt * 8; // gravedad


class FlyingParticle : public Particle {
protected:
    glm::vec2 position;
    glm::vec2 velocity;
    ofColor color;
    float lifetime;
    float age;
    bool exploded;

public:
    FlyingParticle(const glm::vec2& pos, const glm::vec2& vel, const ofColor& col, float life)
        : position(pos), velocity(vel), color(col), lifetime(life), age(0), exploded(false) {}

    void update(float dt) override {
        // Movimiento rectilíneo uniforme (SIN gravedad)
        position += velocity * dt;
        age += dt;

        // Condición de explosión (igual que RisingParticle)
        float explosionThreshold = ofGetHeight() * 0.15 + ofRandom(-30, 30);

        if (position.y <= explosionThreshold || age >= lifetime) {
            exploded = true;
        }
    }

    void draw() override {
        ofSetColor(color);
        ofDrawCircle(position, 10);
    }

    bool isDead() const override {
        return exploded;
    }

    bool shouldExplode() const override {
        return exploded;
    }

    glm::vec2 getPosition() const override {
        return position;
    }

    ofColor getColor() const override {
        return color;
    }
};

**B.**
Explosión:

class TriangleExplosion : public ExplosionParticle {
public:
    TriangleExplosion(const glm::vec2& pos, const ofColor& col)
        : ExplosionParticle(pos, glm::vec2(0, 0), col, 1.4f, ofRandom(12, 28)) {

        float angle = ofRandom(0, TWO_PI);
        float speed = ofRandom(80, 200);

        velocity = glm::vec2(cos(angle), sin(angle)) * speed;
    }

    void draw() override {
        ofSetColor(color);

        float halfSize = size * 0.5;

        // Dibujar triángulo centrado en la posición
        ofDrawTriangle(
            position.x, position.y - halfSize,                  // vértice superior
            position.x - halfSize, position.y + halfSize,       // vértice inferior izquierdo
            position.x + halfSize, position.y + halfSize        // vértice inferior derecho
        );
    }
};

