#funcion lambda que da factores primos de un valor.
#se llamara en el parametro de la funcion phi_euler.
factores_primos = lambda valor:[base for base,exponente in factor(valor)]

#funcion que mediante phi euler, calcula la cantidad de coprimos
#de un valor, dado los factores primos del mismo.
def phi_euler(numero):

    valor = numero
    for x in factores_primos(numero):
        valor*=(1-1/x)

    return valor
