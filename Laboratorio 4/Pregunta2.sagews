def find_lcg_params(outputs, m):
    x0, x1, x2 = outputs
    try:
        a = ((x2 - x1) * inverse_mod(x1 - x0, m)) % m
    except ZeroDivisionError:
        return "No se puede encontrar 'a', divisor por cero."
    c = (x1 - a * x0) % m
    return a, c



# Ejemplo de generador congruencial lineal conocido
m = 16  # Módulo
a = 5   # Parámetro a
c = 3   # Parámetro c
x0 = 7  # Semilla

# Generar tres salidas sucesivas del LCG
x1 = (a * x0 + c) % m
x2 = (a * x1 + c) % m
x3 = (a * x2 + c) % m

# Usar la función para intentar encontrar los valores de 'a' y 'c'
outputs = [x0, x1, x2]
result = find_lcg_params(outputs, m)

# Mostrar los resultados
print("Parámetros originales: a =", a, ", c =", c)
print("Parámetros encontrados: a =", result[0], ", c =", result[1])

# Prueba con otros valores de salida
outputs2 = [3, 7, 11]
m2 = 13
result2 = find_lcg_params(outputs2, m2)
print("Prueba con valores desconocidos:", result2)
︡bff7e5c6-177f-4611-b9d8-9dae81715513︡{"stdout":"\"\\n    toma tres salidas consecutivas de un generador de números congruencial lineal\\n    (LCG) y el valor del módulo 'm' para encontrar los valores de 'a' y 'c'.\\n\\n    Argumentos:\\n    outputs -- una lista de tres números enteros, que son las salidas sucesivas del LCG.\\n    m -- el módulo utilizado por el LCG.\\n\\n    Retorna:\\n    (a, c) -- los valores encontrados de 'a' y 'c', o un mensaje si no se pueden encontrar.\\n    \"\n"}︡{"stdout":"Parámetros originales: a = 5 , c = 3\n"}︡{"stdout":"Parámetros encontrados: a = 5 , c = 3\n"}︡{"stdout":"Prueba con valores desconocidos: (1, 4)\n"}︡{"done":true}









