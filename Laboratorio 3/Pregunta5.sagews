#funcion cuyos parametros son un entero x, una base b y modulo N
def calcula(x,N,b):
    return [power_mod(x,i,N) for i in range(b)]


def exp_modular(x,e,b,N,potencias):

    resultado = 1
    potencia_actual = 1

    while(e>0):
        #dgito menos significativo en la base b
        digito = e % b
        e //= b
        resultado = (resultado * potencias[digito]) % N
        # si es mayor a 0, eleva la potencia a la base b
    if(e > 0):
        x = (x ** b) % N

    return resultado

# parametros de prueba
x = 3
e = 13
b = 4
N = 17

potencias = calcula(x,N,b)
print(potencias)
resultado = exp_modular(x, e, b, N,potencias)
print(f"El resultado de {x}^{e} mod {N} es: {resultado}")
