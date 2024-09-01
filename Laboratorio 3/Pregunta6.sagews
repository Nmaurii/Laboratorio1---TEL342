︠a872c03b-71c0-4261-9d05-e60656e10b10s︠
# (a) Implementa una función que genere un estado interno inicial aleatorio s
# Esta función devuelve una lista con [P, Q, X, Y, s]

def inicializar_estado_rng(P, Q, X, Y):
    s = randint(1, Q-1)  # Genera un entero aleatorio s mod Q
    return [P, Q, X, Y, s]

# Prueba para la función (a)
P = 15116301544809716639
Q = 7558150772404858319
X = 10655637283854386401
Y = 5886823825742381258
estado_inicial = inicializar_estado_rng(P, Q, X, Y)
print("Estado inicial:", estado_inicial)


# (b) Implementa una función que genere un bloque de salida y actualice el estado del RNG
# Esta función toma como parámetro el estado interno generado por la función de (a)

def generar_salida_y_actualizar_estado(estado_rng):
    P, Q, X, Y, s = estado_rng
    salida = (pow(X, s, P) * pow(Y, s, P)) % P  # Genera un bloque de salida
    estado_rng[-1] = (s + 1) % Q  # Actualiza el estado s mod Q
    return salida

# Prueba para la función (b)
salida = generar_salida_y_actualizar_estado(estado_inicial)
print("Bloque de salida:", salida)
print("Estado actualizado:", estado_inicial)


# (c) Encuentra el entero positivo f tal que Y^f ≡ X mod P
# Se utiliza la pista proporcionada para encontrar f

def encontrar_f(P, Q, X, Y, e):
    f = (1 + Q * inverse_mod(e, Q)) % Q  # Calcula f tal que e*f = 1 + k*Q
    return f

# Prueba para la función (c)
e = 1534964830632783921
f = encontrar_f(P, Q, X, Y, e)
print("Valor de f:", f)


# (d) Escribe una función que dado el resultado de la función de generación, calcule la siguiente salida

def siguiente_salida_dado_anterior(salida, P, Q, X, Y, f):
    return pow(salida, f, P)

# Prueba para la función (d)
siguiente_salida = siguiente_salida_dado_anterior(salida, P, Q, X, Y, f)
print("Siguiente bloque de salida:", siguiente_salida)


# (e) Versión de la función que toma P, Q y X y genera Y y f
# Devuelve una tupla (estado_rng, f)

def generar_estado_rng_y_f(P, Q, X):
    e = randint(1, Q-1)  # Genera un exponente e aleatorio
    Y = pow(X, e, P)
    f = encontrar_f(P, Q, X, Y, e)
    estado_rng = inicializar_estado_rng(P, Q, X, Y)
    return estado_rng, f

# Prueba para la función (e)
estado_rng, f = generar_estado_rng_y_f(P, Q, X)
print("Nuevo estado del RNG:", estado_rng)
print("Valor de f:", f)


# (f) Generaliza la función de ataque para que funcione dado un bloque de salida, Y y f

def ataque_generalizado(salida, P, Q, Y, f):
    return pow(salida, f, P)

# Prueba para la función (f)
salida_ataque = ataque_generalizado(salida, P, Q, Y, f)
print("Salida generada por el ataque generalizado:", salida_ataque)


# (g) Modificación del RNG para superar el problema
# Una solución sería incluir un proceso de salting o añadir una función de hash criptográfica al resultado.

def rng_seguro(P, Q, X, Y):
    s = randint(1, Q-1)
    salida = (pow(X, s, P) * pow(Y, s, P)) % P
    # Añadir una función hash criptográfica
    salida_segura = hash(salida)
    return salida_segura

# Prueba para la función (g)
salida_segura = rng_seguro(P, Q, X, Y)
print("Bloque de salida seguro:", salida_segura)
︡222c9fa2-c176-45b7-b641-d6c7044bc34c︡{"stdout":"Estado inicial: [15116301544809716639, 7558150772404858319, 10655637283854386401, 5886823825742381258, 6977851150907003021]\n"}︡{"stdout":"Bloque de salida: 3719806915929496826\n"}︡{"stdout":"Estado actualizado: [15116301544809716639, 7558150772404858319, 10655637283854386401, 5886823825742381258, 6977851150907003022]\n"}︡{"stdout":"Valor de f: 1\n"}︡{"stdout":"Siguiente bloque de salida: 3719806915929496826\n"}︡{"stdout":"Nuevo estado del RNG: [15116301544809716639, 7558150772404858319, 10655637283854386401, 11490909636357507060, 2708103487480328865]\n"}︡{"stdout":"Valor de f: 1\n"}︡{"stdout":"Salida generada por el ataque generalizado: 3719806915929496826\n"}︡{"stdout":"Bloque de salida seguro: 1422857816491026948\n"}︡{"done":true}









