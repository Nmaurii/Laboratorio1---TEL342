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

#funcion de cifrado afin, recibe un texto plano y una llave la cual es una tupla con dos terminos (a,b)
def cifrado_afin(k, texto):
    a , b = k
    texto_cifrado = []

    for letra in texto:
        if(ingles_alfabeto(letra)):
            if(verificar_a(a)):
                c = mod((a*convertir_numero(letra))+b)
                texto_cifrado.append(chr(c+97))
            else:
                print("El valor de 'a' es invalido")
        else:
            texto_cifrado.append(letra)

    return ''.join(texto_cifrado)


#funcion de descifrado afin, recibe un texto cifrado y una llave la cual es una tupla con dos terminos (a,b)
def descifrado_afin(k, texto_cif):
    a , b = k
    texto_original = []

    for letra in texto_cif:
        if(ingles_alfabeto(letra)):
            if(verificar_a(a)):
                p = mod((convertir_numero(letra)-b)/a)
                texto_original.append(chr(p+97))
            else:
                print("El valor de 'a' es invalido")
        else:
            texto_original.append(letra)

    return ''.join(texto_original)

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



def cifrado_hill_mxm(texto_cif, matriz):
    
    K = Matrix(ZZ, matriz)
    palabras_por_particion = K.nrows()
    cant_particiones = math.ceil(len(texto_cif) / palabras_por_particion)
    
    nletra = 0
    particiones = []
    vectores = []
    vector = []
    vector_cifrado = []
    resultado = 0
    resultado_mod = 0
    
    char1 = ""
    mensaje_cif = ""
    
    if(K.determinant() == 0 or (K.determinant()%2 == 0 or K.determinant()%13 == 0 or K.determinant()%26 == 0)):
        print("La Matriz llave no es invertible o al menos no en modulo 26")
        return 0
    
    for i in range(cant_particiones):
        particiones.append(texto_cif[i*palabras_por_particion: (i+1)*palabras_por_particion])
       
    if(len(particiones[cant_particiones - 1]) != palabras_por_particion):
        
        particiones[cant_particiones - 1] += "x"*(palabras_por_particion - len(particiones[cant_particiones - 1]))
    
    for i in range(cant_particiones):
        
        for j in range(len(particiones[i])):
            
            nletra = convertir_numero(particiones[i][j])
            vector.append(nletra)
            
        vectores.append(vector)
        vector = []
        
    vectores = Matrix(ZZ, vectores)
    
    for i in range(vectores.nrows()):
        
        resultado = (vectores[i]*K)
        resultado_mod = mod(resultado)
        vector_cifrado.append(resultado_mod)
        
    for i in range(cant_particiones):
        
        for j in range(palabras_por_particion):
            
            char1 = chr(vector_cifrado[i][j] + 97)
            mensaje_cif = mensaje_cif + char1
    
    return mensaje_cif

#[[6, 24, 1],[13, 16, 4],[5, 9, 17]] ESTA ES COPRIMA

def descifrado_hill_mxm(texto_cif, matriz):
    
    K = Matrix(ZZ, matriz)
    palabras_por_particion = K.nrows()
    cant_particiones = math.ceil(len(texto_cif) / palabras_por_particion)
    
    nletra = 0
    particiones = []
    vectores = []
    vector = []
    vector_descifrado = []
    resultado = 0
    resultado_mod = 0
    
    char1 = ""
    mensaje_descif = ""
    
    if(K.determinant() == 0 or (K.determinant()%2 == 0 or K.determinant()%13 == 0 or K.determinant()%26 == 0)):
        print("La Matriz llave no es invertible o al menos no en modulo 26")
        return 0
    
    for i in range(cant_particiones):
        particiones.append(texto_cif[i*palabras_por_particion: (i+1)*palabras_por_particion])
    
    for i in range(cant_particiones):
        
        for j in range(len(particiones[i])):
            
            nletra = convertir_numero(particiones[i][j])
            vector.append(nletra)
            
        vectores.append(vector)
        vector = []
        
    vectores = Matrix(ZZ, vectores)
    
    for i in range(vectores.nrows()):
        
        resultado = (vectores[i]*K.inverse())
        resultado_mod = mod(resultado)
        vector_descifrado.append(resultado_mod)
        
    for i in range(cant_particiones):
        
        for j in range(palabras_por_particion):
            
            char1 = chr(vector_descifrado[i][j] + 97)
            mensaje_descif = mensaje_descif + char1
    
    
    #print(mensaje_cif)
    return mensaje_descif


mensaje_cifrado = cifrado_hill_mxm("lastresveintedelamanana", [[6, 24, 1],[13, 16, 4],[5, 9, 17]])
#print(mensaje_cifrado)
descifrado_hill_mxm(mensaje_cifrado, [[6, 24, 1],[13, 16, 4],[5, 9, 17]])

#[[6, 24, 1],[13, 16, 4],[5, 9, 17]] ES COPRIMA         ####################################################################
#[[1, -1, 2],[-2, 0, 4],[0, -2, 7]] NO ES COPRIMA        ###################################################################

#print("///Pruebas cifrado/descifrado afin")

#print(cifrado_afin((17,8),"john smith is the culprit!"))

#print(descifrado_afin((17,8),"fmxv ceotx oc txy qkndlot! \n"))

#print("///Pruebas cifrado/descifrado hill 2x2")

#print(cifrado_hill_2x2("ilikepurpledinosaurs", [[1,2], [3,5]]))

#print(descifrado_hill_2x2("ebcwijcplwkbilycowbl", [[1,2], [3,5]]))