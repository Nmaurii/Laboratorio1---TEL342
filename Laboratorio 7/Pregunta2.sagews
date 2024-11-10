︠8562af0e-4084-4280-8415-d92da98007f0s︠
 #PROBLEMA 2
    #Pregunta a

    
from random import randint

def primos_q_y_p():
    for i in range(100):
        lista = list(prime_range((i+1)*10, (i+1)*10 + 100))

        for k in range(len(lista)):

            q = lista[k]
            p = 2*q + 1

            if (is_prime(p)):

                return q, p
    return -1

def Cuatro_Elementos(limite):

    g = 2
    
    for i in range(100):
        lista = list(prime_range(5, limite))

        for k in range(len(lista)):

            q = lista[k]
            p = 2*q + 1

            if (is_prime(p)):
                
                break
    
    F = GF(p)
    
    while g<p:
            
        if ((g^q)%p == 1):
            
            for i in range(q):
                
                if((g^(i+1))%p == 1 and i+1 != q):
                    
                    break
                    
                if(i+1 == q):
                    return g, p, q, F

        g = g + 1

    return 0


g, p, q, F = Cuatro_Elementos(100)

print("Pregunta A")
print("Los elementos entregados son: ")
print(Cuatro_Elementos(100))

    #PREGUNTA b
    
def Par_Xx_Yy(g, p, q, F):
    
    x = randint(2, q)
    X = F(g)^x
    
    return x,X

x, X = Par_Xx_Yy(g,p,q,F)
print("\n")
print("Pregunta B")
print(f"La variable x es igual a: {x}")
print(f"La variable X es igual a: {X}")

    #Pregunta c

def Clave_Secreta(x,Y,p):
    
    K = (Y^x)%p
    
    return K 

print("\n")
print("Pregunta C")
print("La clave generada con una clave compartida igual a " + str(39674) + " es: " + str(Clave_Secreta(x, 39674,p)))
    
    #Pregunta d
    
#EJEMPLO PRACTICO


print("Se utiliza 'x' e 'y' al azar ")

g, p, q, F = Cuatro_Elementos(100)

print(f"g, p y q será igual a: {g}, {p}, y {q} respectivamente")

x, X = Par_Xx_Yy(g,p,q,F)
y, Y = Par_Xx_Yy(g,p,q,F)

print(f"Entonces, los pares son: x={x}, X={X}, y={y} e Y={Y}")

K_Bob = Clave_Secreta(x,Y,p)
K_Alice = Clave_Secreta(y,X,p)

print(f"Entonces, las claves generadas pro ambos son: Alice->{K_Alice} y Bob->{K_Bob}")
︡1d2bbd8d-43a7-4d5a-9f4c-87bbecb23b9e︡{"stdout":"Pregunta A\n"}︡{"stdout":"Los elementos entregados son: \n"}︡{"stdout":"(3, 11, 5, Finite Field of size 11)\n"}︡{"stdout":"\n\n"}︡{"stdout":"Pregunta B\n"}︡{"stdout":"La variable x es igual a: 4\n"}︡{"stdout":"La variable X es igual a: 4\n"}︡{"stdout":"\n\n"}︡{"stdout":"Pregunta C\n"}︡{"stdout":"La clave generada con una clave compartida igual a 39674 es: 4\n"}︡{"stdout":"Se utiliza 'x' e 'y' al azar \n"}︡{"stdout":"g, p y q será igual a: 3, 11, y 5 respectivamente\n"}︡{"stdout":"Entonces, los pares son: x=4, X=4, y=3 e Y=5\n"}︡{"stdout":"Entonces, las claves generadas pro ambos son: Alice->9 y Bob->9\n"}︡{"done":true}









