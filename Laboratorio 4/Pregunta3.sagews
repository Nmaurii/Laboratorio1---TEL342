︠87dc942e-660e-4778-8e44-de42b3c5dd96s︠
# Definición de SDES simplificado
def sdes_encrypt(block, key):
    # Simplificación de SDES, este es un ejemplo que debes ajustar según las reglas de SDES
    # Aquí solo aplicamos XOR con los primeros 8 bits de la clave (por simplicidad).
    return [(bit ^ key[i]) for i, bit in enumerate(block)]

def prng_sdes(v, dt, key):
    
    encrypted_dt = sdes_encrypt(dt, key)

    xor_result = [(v[i] ^ encrypted_dt[i]) for i in range(8)]

    random_value = sdes_encrypt(xor_result, key)

    return random_value

# Prueba del PRNG con SDES
v_sdes = [1, 0, 1, 0, 1, 0, 1, 0]  # Semilla (8 bits)
dt_sdes = [0, 1, 0, 1, 0, 1, 0, 1]  # Variables de fecha/hora (8 bits)
key_sdes = [1, 1, 0, 0, 1, 1, 0, 0, 1, 1]  # Clave SDES (10 bits)

# Generar un valor pseudoaleatorio
random_value_sdes = prng_sdes(v_sdes, dt_sdes, key_sdes)
print("Valor pseudoaleatorio generado con SDES:", random_value_sdes)
︡8ddd34c5-12d3-464c-a801-b69e7b776f94︡{"stdout":"Valor pseudoaleatorio generado con SDES: [1, 0, 1, 1, 1, 0, 1, 1]\n"}︡{"done":true}
︠0ce65b26-2a0e-4225-94e4-d7f52a8eb799s︠
# Definición de SAES simplificado
def saes_encrypt(block, key):
    # Simplificación de SAES, este es un ejemplo que debes ajustar según las reglas de SAES
    # Aquí solo aplicamos XOR con la clave (por simplicidad).
    return [(bit ^ key[i]) for i, bit in enumerate(block)]

def prng_saes(v, dt, key):

    #Cifrar DT usando SAES y la clave proporcionada
    encrypted_dt = saes_encrypt(dt, key)

    #Realizar XOR entre el resultado cifrado y la semilla V
    xor_result = [(v[i] ^ encrypted_dt[i]) for i in range(16)]

    #Cifrar el resultado XOR nuevamente usando SAES
    random_value = saes_encrypt(xor_result, key)

    return random_value


# Prueba del PRNG con SAES
v_saes = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]  # Semilla (16 bits)
dt_saes = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]  # Variables de fecha/hora (16 bits)
key_saes = [1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0]  # Clave SAES (16 bits)

# Generar un valor pseudoaleatorio
random_value_saes = prng_saes(v_saes, dt_saes, key_saes)
print("Valor pseudoaleatorio generado con SAES:", random_value_saes)
︡9e58687c-79e4-49cc-a61c-939b107f63f3︡{"stdout":"Valor pseudoaleatorio generado con SAES: [1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1]\n"}︡{"done":true}










