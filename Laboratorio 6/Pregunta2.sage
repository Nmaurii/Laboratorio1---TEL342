#importamos la funciones usadas en la pregunta 1 
load('Pregunta1.sage')

#================ Item 2 => Pregunta (a)-(c)

'''
dado que una forma de determinar si la clave publica y los valores primos p y q son buenos,
es verificar que sea inviable obtener d dado los valores e y n.
'''

'''
Como se vio en clases, los valores mas comunes para exponente publico e son 3,17 y 655537, 
donde e = 3 es propenso a tener ataques de fuerza bruta, por lo que no se recomiendo su uso.

Se determino que para obtener dado un e igual a 3 y N 13962799, no hubo problemas.
Para determinar que las firmas sean buenas, se encriptara el valor a firmar y se desencriptara
el valor firmado, si hay una equivalencia es porque son buenas.
'''


def check_firma(n,e,valor_firmar,firma):
    if(encrpitado(n,e,firma) == valor_firmar):
        return True
    return False


#================== Pregunta (a)

#N = 13962799, e = 3, valor a firmar = 821 y firma = 8674413.

m = 821
c = 8674413
n = 13962799
e = 3

valor_constante = valor_d(e,phi_euler(n))
print("Clave publica : Pu[{0},{1}] -> Es buena la firma {3}: {2} ".format(e,n,check_firma(n,e,m,c),m))

#================== Pregunta (c)

m = 2478
c = 27535246
n = 34300129
e = 61

valor_constante = valor_d(e,phi_euler(n))
print("Clave publica : Pu[{0},{1}] -> Es buena la firma {3}: {2} ".format(e,n,check_firma(n,e,m,c),m))

#================== Pregunta (c)

m = 419
c = 2607727
n = 5898461
e = 23

valor_constante = valor_d(e,phi_euler(n))
print("Clave publica : Pu[{0},{1}] -> Es buena la firma {3}: {2} ".format(e,n,check_firma(n,e,m,c),m))

#================== Pregunta (c)

'''
Para este item se encripta para obtener la firma, luego se desencripta para confirmar que coincidan los 
valores.
'''

p = 3181
q = 2677
e = 163
m = 521

firma = encrpitado((p*q),e,m)
firmar = desencriptar((p*q),e,firma)

print("firma generada (encriptado) : {0} y su confirmacion (descifrado): {1}".format(firma,firmar))
