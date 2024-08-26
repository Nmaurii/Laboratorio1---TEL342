#se evalua que el caracter este en la tabla de valores ASCII, especificamente en el rango de letras minusculas corresponde desde el 97 al 122.
def ingles_alfabeto(letra,bool=false):
    if(ord(letra.lower())>=97 and ord(letra.lower())<=122):
        bool = true
    return bool

#dado que la letra 'a' se ubica en la posicion 97 en ASCII, se debe hacer un desplazamiento de cada posicion de 97 unidades respecto cada letra ingresada.
def convertir_numero(letra):
    return ord(letra.lower())-97

#funcion que retorna la operacion mod 26 sobre la suma de key mas el valor de la letra como parametro (c+k), siendo este llave_letra.
def mod(letra_llave):
    return letra_llave % 26

#funcion que comprueba que "a" no sea divisible por 2 ni por 13
def verificar_a(a, bool=false):
    if(a % 2 != 0 | a % 13 != 0):
        bool = true
    return bool

#funcion de cifrado hill, recibe un texto plano y una llave la cual es una matriz de 2x2 invertible de Sage sobre los enteros modulo 26.
def cifrado_hill_2x2(texto, K):
    key = Matrix(ZZ,K)

    pares = []

    for i in range(0, len(texto), 2):
            pares.append(texto[i:i+2])

    texto_cifrado = []

    if(key.is_invertible()):
        for par in pares:
            vector = matrix([[convertir_numero(par[0])], [convertir_numero(par[1])]])
            c = key * vector
            for i in range (0,2):
                coef = mod(int(c[i,0]))
                texto_cifrado.append(chr(coef+97))
    else:
        print("La matriz clave no es invertible, ingrese otra")
    return ''.join(texto_cifrado)


#funcion de descifrado hill, recibe un texto cifrado y una llave la cual es una matriz de 2x2 invertible de Sage sobre los enteros modulo 26.
def descifrado_hill_2x2(texto_cif, K):
    key = Matrix(ZZ,K)

    pares = []

    for i in range(0, len(texto_cif), 2):
        pares.append(texto_cif[i:i+2])

    texto_original = []

    if(key.is_invertible()):
        inversa = key.inverse()
        for par in pares:
            vector = matrix([[convertir_numero(par[0])], [convertir_numero(par[1])]])
            c = inversa * vector
            for i in range (0,2):
                coef = mod(int(c[i,0]))
                texto_original.append(chr(coef+97))
    else:
        print("La matriz clave no es invertible, ingrese otra")
    return ''.join(texto_original)



print("///Pruebas cifrado/descifrado hill 2x2")

print(cifrado_hill_2x2("ilikepurpledinosaurs", [[1,2], [3,5]]))

print(descifrado_hill_2x2("ebcwijcplwkbilycowbl", [[1,2], [3,5]]))