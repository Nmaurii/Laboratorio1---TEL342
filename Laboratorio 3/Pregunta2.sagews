#funcion n-1
def descomposicion(valor):

    r = 0 #cantidad de iteraciones/divisiones posibles de valor/2
    d = valor-1#valor final

    while(d % 2 == 0):

        d//=2
        r+=1

    return (r,d)

#debemos elegir numero aleatorio de 2<= n <= n-2

random = lambda valor:randint(2,valor-2)

def funcion_miller_rabin(valor,numero):
    r,d = descomposicion(valor)
    return (numero**d % valor)**2 % valor

def testigos(valor,cantidad):
    return [randint(2,valor-2) for _ in range(cantidad)]

def miller_rabin(valor,testigos):

    verificados = {
        elemento: (funcion_miller_rabin(valor, elemento) == valor - 1)
        for elemento in testigos
    }
    return verificados
