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

def valor_d(e,phi):
    #aqui se determina el valor k de  : d x e = 1 + k * pi(n)
    x = 1
    while True:
        if((1+x*phi) % e == 0):
            return (1+x*phi)/e
        x+=1

#================ Item 1 => Pregunta (a)
#================ Desencrpitado 

def descifrado(n,e,c):
    d = valor_d(e,phi_euler(n))
    return (pow(c,d) % (n))

#print(descifrado((6569*8089),11,28901722))

#================ Item 1 => Pregunta (b)
#================ Encrpitado 

def cifrado(n,e,m):
    return pow(m,e) % n

#print(cifrado(37617577,529,449))

#================ Item 1 => Pregunta (c)

def valor_e(d,phi):

    #aqui se determina el valor k de  : d x e = 1 + k * pi(n)
    x = 1
    while True:
        if((1+x*phi) % d == 0):
            return (1+x*phi)/d
        x+=1

#print(valor_e(223,phi_euler(1723*5381)))

#================ Item 1 => Pregunta (d)

#definimos las siguientes funciones :

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

