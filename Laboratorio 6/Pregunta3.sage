factores_primos = lambda valor:[base for base,exponente in factor(valor)]

def phi_euler(numero):
    valor = numero
    for x in factores_primos(numero):
        valor*=(1-1/x)
    return valor

def check_primo(x):
    for n in range(2,x):
        if x % n == 0:
            return False
    return True

def valor_e(d,phi):
    #aqui se determina el valor k de  : d x e = 1 + k * pi(n)
    x = 1
    while True:
        if((1+x*phi) % d == 0):
            return (1+x*phi)/d
        x+=1

def valor_d(e,phi):
    #aqui se determina el valor k de  : d x e = 1 + k * pi(n)
    x = 1
    while True:
        if((1+x*phi) % e == 0):
            return (1+x*phi)/e
        x+=1


#================== Pregunta (a)

'''
Para generar claves necesitamos determinar valor p y q, primos, como tambien los exponentes e y d,
publico y privado respectivamente.Para esto se crea una funcion que tenga como input dos valores primos.
'''

def generador_valores(p,q):

    phi = phi_euler((p*q))

    while True:
        e = randint(2,phi-1)
        if(gcd(phi,e) == 1  and e != valor_d(e,phi)):
            d = valor_d(e,phi)
            return e,d

def generador_RSA(p,q):

    e,d = generador_valores(p,q)
    n = p*q
    return (e,n),(d,n)


#================== Pregunta (b)

def cifrado(n,e,m):
    return pow(m,e,n)


#================== Pregunta (c)

def descifrado(n,d,c):
    #d = valor_d(e,phi_euler(n))
    return pow(c,d,n)


#================== Pregunta (d)

p = 61
q = 53
n = p*q

publica,privada = generador_RSA(p,q)
d = valor_d(publica[0],phi_euler(n))

print("Clave publica : Pu{0}\nClave privada : Pr{1} ".format(publica,privada))

mensaje = 30
mensaje_cifrado = cifrado(n,publica[0],mensaje)
mensaje_descifrado = descifrado(n,d,mensaje_cifrado)

print("[{0}] -> [{1}] -> [{2}]".format(mensaje,mensaje_cifrado,mensaje_descifrado))

