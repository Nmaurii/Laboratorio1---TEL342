#funcion lambda que da factores primos de un valor.
factores_primos = lambda valor:[base for base,exponente in factor(valor)]

#funcion que mediante phi euler, calcula la cantidad de coprimos
#de un valor, dado los factores primos del mismo.
def phi_euler(numero):

    valor = numero
    for x in factores_primos(numero):
        valor*=(1-1/x)

    return valor
