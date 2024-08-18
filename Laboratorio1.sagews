#se evalua que el caracter este en la tabla de valores ASCII, especificamente en el rango de letras minusculas que corresponde del 97 al 122.
def ingles_alfabeto(letra,bool=False):
    if(ord(letra.lower())>=97 and ord(letra.lower())<=122):
        bool = True
    return bool

#dado que la letra 'a' se ubica en la posicion 97 en ASCII, se debe hacer un desplzamiento de cada posicion de 97 unidades respecto cada letra ingresada.
def convertir_numero(letra):
    return ord(letra.lower())-97

#funcion que retorna la operacion mod 26 sobre la suma de key mas el valor de la letra como parametro (c+k), siendo este llave_letra.
def mod(letra_llave):
    return letra_llave % 26

#funcion cifrado de una cadena de texto mediante algoritmo de cesar, esta implementacion es simple.
def cifrado(key,palabra):
    palabra_cifrada = []
    for letra in palabra:
        if(ingles_alfabeto(letra)):
            mover = mod((convertir_numero(letra))+key)
            palabra_cifrada.append(chr(mover+97))
        else:
            palabra_cifrada.append(letra)
    return ''.join(palabra_cifrada)

#para el descifrado se hizo una funcion mucho mas acotada en cuanto a lineas, pero que no pierde la logica vista en la funcion de cifrado
def descifrado(key,palabra):

    original = [

        chr(mod((convertir_numero(letra))-key)+97)
        if(ingles_alfabeto(letra))
        else letra
        for letra in palabra
    ]
    return ''.join(original)

#funcion de ataque
def ataque(palabra,subcadena=''):

    descifrada = []

    for key in range(26):

        descifrada = descifrado(key,palabra)

        if(subcadena in descifrada and subcadena != ''):

            print('Key : {0}  --> Palabra : {1}'.format(key,descifrada))

        if(subcadena == ''):
            
            print('Key : {0}  --> Palabra : {1}'.format(key,descifrada))



#==========

#-----------Pruebas de cifrado parte a
print('Cifrado \n')
prueba_1 = {
    6:'et me a vanilla ice cream, make it a double.',
    15:'don’t much care for Leonard Cohen.',
    16:'I like root beer floats.'
}

for llave,palabra in prueba_1.items():
    print(cifrado(llave,palabra))
    
#-----------Pruebas de descifradio parte a
print('\nDescifrado\n')

prueba_2 = {
    
    12:'nduzs ftq buzq oazqe.',
    3:'fdhvdu qhhgv wr orvh zhljkw.',
    20:'ufgihxm uly numnys.'
}

for llave,palabra in prueba_2.items():
    print(descifrado(llave,palabra))
    
#-----------Pruebas de Ataque parte b
print('\nDescifrado por ataque')

prueba_3 = {
    
    'gryy gurz gb tb gb nzoebfr puncry.':'chapel',
    'wziv kyv jyfk nyve kyv tpdsrcj tirjy.':'cymbal',
    'baeeq klwosjl osk s esf ozg cfwo lgg emuz.':''
}

for palabra,subcadena in prueba_3.items():
    print('\nAtaque de descifrado de : ',palabra,' con sub cadena : ',subcadena)
    ataque(palabra,subcadena)
