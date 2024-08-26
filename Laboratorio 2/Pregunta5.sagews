︠264aebc7-2564-4992-98c9-239e17242d33s︠
def convertir_numero(letra):
    return ord(letra.lower())-97

def mod(letra_llave):
    return letra_llave % 26


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
        print("La Matriz llave no es invertible, o no es invertible en el modulo 26")
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
        print("La Matriz llave no es invertible, o no es invertible en el modulo 26")
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

    return mensaje_descif

mensaje_cifrado = cifrado_hill_mxm("lastresveintedelamanana", [[6, 24, 1],[13, 16, 4],[5, 9, 17]])
print(mensaje_cifrado)
descifrado_hill_mxm(mensaje_cifrado, [[6, 24, 1],[13, 16, 4],[5, 9, 17]])
︡358f7346-4888-48f8-9586-062e6213c4c5︡{"stdout":"akfrkzlyoaztfygwihnaalzo\n"}︡{"stdout":"'lastresveintedelamananax'\n"}︡{"done":true}










