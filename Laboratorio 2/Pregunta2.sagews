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



print("///Pruebas cifrado/descifrado afin")

print(cifrado_afin((17,8),"john smith is the culprit!"))

print(descifrado_afin((17,8),"fmxv ceotx oc txy qkndlot! \n"))