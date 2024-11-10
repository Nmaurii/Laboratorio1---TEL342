︠742effca-8881-4911-9869-f1b80ac84c2bs︠
#LAB 7 Problema 1

    #PREGUNTA a

def modulo_p(num, g, p):

    conv = (g^num)%p

    return conv

p = 70849
g = 2

X = 39674 #Clave publica de Alice

valor_y = 24221 #Valor secreto de Bob

Y = modulo_p(valor_y, g, p) #Clave publica de Bob. Se envia a Alice

K = (X^(valor_y))%p

print("Pregunta A")
print("Valor 'y' calculado: " + str(valor_y))
print("Valor 'Y' para enviar a Alice: " + str(Y))
print("Clave compartida 'K': " + str(K))

print("\n")

#PREGUNTA b

p = 6779
g = 3

x = 384
y = 152

X = (g^x)%p
Y = (g^y)%p

print("Pregunta B")
print("Valor 'X' generado por Bob para Alice: " + str(X))
print("Valor 'Y' generado por Alice para Bob: " + str(Y))
print("Es la clave 'K' igual para ambos?: " + str( (X^y)%p == (Y^x)%p) )
print("Clave 'K' generada por Alice y Bob: " + str((X^y)%p) + " y " + str((Y^x)%p) + " respectivamente")

print("\n")

    #PREGUNTA c

def primos_q_y_p():
    for i in range(100):
        lista = list(prime_range((i+1)*10, (i+1)*10 + 100))

        for k in range(len(lista)):

            q = lista[k]
            p = 2*q + 1

            if (is_prime(p)):

                return q, p
    return -1

def generar_g(q, p):

    g = 2

    while g<p:
            
        if ((g^q)%p == 1):
            
            for i in range(q):
                
                if((g^(i+1))%p == 1 and i+1 != q):
                    
                    break
                    
                if(i+1 == q):
                    return g

        g = g + 1

    return 0


q, p = primos_q_y_p()


g = generar_g(q, p)

x = 384
y = 152

X = (g^x)%p
Y = (g^y)%p
print("Pregunta C")
print("Valor 'X' generado por Bob para Alice: " + str(X))
print("Valor 'Y' generado por Alice para Bob: " + str(Y))
print("Es la clave 'K' igual para ambos?: " + str( (X^y)%p == (Y^x)%p) )
print("Clave 'K' generada por Alice y Bob: " + str((X^y)%p) + " y " + str((Y^x)%p) + " respectivamente")
︡9bdc2c10-4ed8-442e-93c3-3e3e65634ea4︡{"stdout":"Pregunta A\n"}︡{"stdout":"Valor 'y' calculado: 24221\n"}︡{"stdout":"Valor 'Y' para enviar a Alice: 48033\n"}︡{"stdout":"Clave compartida 'K': 65654\n"}︡{"stdout":"\n\n"}︡{"stdout":"Pregunta B\n"}︡{"stdout":"Valor 'X' generado por Bob para Alice: 4437\n"}︡{"stdout":"Valor 'Y' generado por Alice para Bob: 6267\n"}︡{"stdout":"Es la clave 'K' igual para ambos?: True\n"}︡{"stdout":"Clave 'K' generada por Alice y Bob: 6397 y 6397 respectivamente\n"}︡{"stdout":"\n\n"}︡{"stdout":"Pregunta C\n"}︡{"stdout":"Valor 'X' generado por Bob para Alice: 12\n"}︡{"stdout":"Valor 'Y' generado por Alice para Bob: 6\n"}︡{"stdout":"Es la clave 'K' igual para ambos?: True\n"}︡{"stdout":"Clave 'K' generada por Alice y Bob: 4 y 4 respectivamente\n"}︡{"done":true}









