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