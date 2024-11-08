︠60500bf2-3235-4e20-a3c8-52ec65360eb5r︠
load('Pregunta3.sage')

#================ Item 4 => Pregunta (a)

"""
Firma un mensaje utilizando una clave privada RSA.
"""

def firma_rsa(mensaje, clave_privada):

    d, n = clave_privada

    firma = power_mod(mensaje, d, n)

    return firma

#================ Item 4 => Pregunta (b)

"""
Verifica si una firma RSA es válida comparándola con el hash de un mensaje.
"""

def verificar_rsa(firma, hash_mensaje, clave_publica):

    e, n = clave_publica

    hash_calculado = power_mod(firma, e, n)

    if hash_calculado == hash_mensaje:
        verificar = True

    else:
        verificar = False

    return verificar


#================ Item 4 => Pregunta (c)

p = 6569
q = 8089


# Claves en formato de tuplas
clave_publica, clave_privada = generador_RSA(p,q)

# Mensaje a firmar
mensaje = 12345  # Supongamos que este es el hash de un mensaje original

"""
Caso 1: Firma y verificacion validas
"""

firma_valida = firma_rsa(mensaje, clave_privada)
es_valida = verificar_rsa(firma_valida, mensaje, clave_publica)
print(f"Caso válido - Firma generada: {firma_valida}")
print(f"¿La firma es válida? {es_valida}")

"""
Caso 2: Firma incorrecta
"""

firma_incorrecta = firma_valida + 1  # Alteramos la firma
es_valida_incorrecta = verificar_rsa(firma_incorrecta, mensaje)
print(f"Caso inválido - Firma alterada: {firma_incorrecta}")
print(f"¿La firma es válida? {es_valida_incorrecta}")

"""
Caso 3: Hash incorrecto
"""

hash_incorrecto = mensaje + 1  # Alteramos el hash
es_valida_hash_incorrecto = verificar_rsa(firma_valida, hash_incorrecto)
print(f"Caso inválido - Hash alterado: {hash_incorrecto}")
print(f"¿La firma es válida? {es_valida_hash_incorrecto}")
︡3c1e8e83-b237-43e7-bb66-ebe074448cc7︡











