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

Para determinar bien que las firmas sean buenas, se calcula la firma obteniendo antes la exponente
privada, luego cifrando el valor a firmar con la clave privada y verificando que esta coincida con
la firma sugerida.
'''


def check_firma(n,d,valor_firmar,firma):
    if(cifrado(n,d,valor_firmar) == firma):
        return True
    return False


#================== Pregunta (a)

#N = 13962799, e = 3, valor a firmar = 821 y firma = 8674413.

m = 821         #valor a firmar
c = 8674413     #firma
n = 13962799    #N
e = 3           #exponente publico

valor_constante = valor_d(e,phi_euler(n))
print("Clave publica : Pr[{0},{1}] -> Es buena la firma {3}: {2} ".format(valor_constante,n,check_firma(n,valor_constante,m,c),m))

#================== Pregunta (c)

m = 2478
c = 27535246
n = 34300129
e = 61

valor_constante = valor_d(e,phi_euler(n))
print("Clave publica : Pr[{0},{1}] -> Es buena la firma {3}: {2} ".format(valor_constante,n,check_firma(n,valor_constante,m,c),m))

#================== Pregunta (c)

m = 419
c = 2607727
n = 5898461
e = 23

valor_constante = valor_d(e,phi_euler(n))
print("Clave publica : Pr[{0},{1}] -> Es buena la firma {3}: {2} ".format(valor_constante,n,check_firma(n,valor_constante,m,c),m))

#================== Pregunta (d)

'''
Para este item se encripta para obtener la firma, luego se desencripta para confirmar que coincidan los 
valores.
'''

p = 3181
q = 2677
e = 163
m = 521
#calculamos d mediente e

d = valor_d(e,phi_euler(3181*2677))

firma = cifrado((p*q),d,m)
firmar = descifrado((p*q),d,firma)

print("firma generada (encriptado) : {0} y su confirmacion (descifrado): {1}".format(firma,firmar))
