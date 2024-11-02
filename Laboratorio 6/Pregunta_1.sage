factores_primos = lambda valor:[base for base,exponente in factor(valor)]

def phi_euler(numero):
    valor = numero
    for x in factores_primos(numero):
        valor*=(1-1/x)
    return valor

def check_primo(x, es = False):
    if(x <= 3 or x%2 != 0 and x%3 != 0):
        es = True
    return es

def valor_d(e,phi):
    #aqui se determina el valor k de  : d x e = 1 + k * pi(n)
    x = 1
    while True:
        if((1+x*phi) % e == 0):
            return (1+x*phi)/e
        x+=1

#================ Item 1 => Pregunta (a)
#================ Desencrpitado 

def desencriptar(n,e,c):
    d = valor_d(e,phi_euler(n))
    return (pow(c,d) % (n))

#print(desencriptar((6569*8089),11,28901722))

#================ Item 1 => Pregunta (b)
#================ Encrpitado 

def encrpitado(n,e,m):
    return pow(m,e) % n

#print(encrpitado(37617577,529,449))

#================ Item 1 => Pregunta (c)

def valor_e(d,phi):
    #aqui se determina el valor k de  : d x e = 1 + k * pi(n)
    x = 1
    while True:
        if((1+x*phi) % d == 0):
            return (1+x*phi)/d
        x+=1

print(valor_e(223,phi_euler(1723*5381)))

#================ Item 1 => Pregunta (d)

