
def BreakBBWithFactors (state, p, q):

    #verificamos que los numeros entregados como parametros cumplan con ser 3 modulo 4
    if p % 4 != 3 or q % 4 != 3:
        raise ValueError("p y q deben cumplir con 3 modulo 4.")

    #calculamos las raices cuadradas del campo primo
    raiz_p = pow(state, ((p + 1) // 4), p)
    raiz_q = pow(state, ((q + 1) // 4), q)

    pos_estados = []

    #recorremos las raices encontradas
    for pos_p in [raiz_p , (p - raiz_p)]:
        for pos_q in [raiz_q , (q - raiz_q)]:
            
            #encontramos la solucion en el rango de residuos y modulos
            estados = crt([pos_p, pos_q], [p, q])
            pos_estados.append(estados)
            
    #agregamos el estado inicial como posibilidad
    if state not in pos_estados:
        pos_estados.append(state)
    
    #restringimos a que la lista posee solo 4 posibilidades
    pos_estados = [est for est in pos_estados if est != state][:3]  
    pos_estados.append(state)  

    return pos_estados


state = [565184539 * 1038996839, 12345678]
print(BreakBBWithFactors(state[1], 565184539 , 1038996839))

state1 = [104723 * 413123, 6789456]
print(BreakBBWithFactors(state1[1], 104723 , 413123))










