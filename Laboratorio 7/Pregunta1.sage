#========================LAB 7

def llave_privada(q):
    return randint(2,q-1)

def llave_publica(privada,q,a):
    return pow(a,privada)%q

# se considera la llave publica de la parte B de la comunicaicon y la clave privada de la parte A
def calcular_secreto(publica,privada,q):
    return pow(publica,privada)%q    


#********PREGUNTA 1

#=================== (a)

'''
Tenemos que los valores q = 70849 y a = 2, donde q es primo y a es valor primitico de q, cumpliendo
tambien que a < q. Por otra parte, tenemos la clave publica (X = 39674) de la parte B, debemos 
calcular la clave privada de la parte A como tambien ver el mensaje por medio de K = YA^(XB) mod q
'''
# se genera una clave priavada tal que Xb <= q-1
llave_privada_B = llave_privada(70849)

plantilla = "Dada la llave privada de Bob {0} y la llave publica de Alice {1}\nEl valor secreto es : {2}".format(llave_privada_B,39674,calcular_secreto(39674,llave_privada_B,70849))

print(plantilla)

#=================== (b)

'''
Tenemos un q = 6779 y una raiz primitiva a = 3. Tenemos el valor secreto
de BOB como alice, es decir, sus claves privadas. Debemos calcular las 
claves publicas de cada uno.
'''

clave_publica_Alice = llave_publica(384,6779,3)
clave_publica_Bob = llave_publica(152,6779,3)

print("Session Bob :\nLlave publica Alice Ya : {0}\n\nSesion Alice :\nLlave publica Bob Yb : {1}".format(clave_publica_Alice,clave_publica_Bob))


#=================== (c)

def generador(entero):
    while True:
        numero = randint(2,entero-1)
        if( numero % 3 == 1 and check_primo(numero)):
            return numero

'''
def check_primo(x):
    for n in range(2,x):
        if x % n == 0:
            return False
    return True
'''


def check_primo(x):
    if x < 2:
        return False
    for n in range(2, int(sqrt(x)) + 1):
        if x % n == 0:
            return False
    return True

def generador_primo(entero):

    while True:
        primo = randint(2,entero-1)
        if(check_primo(primo)):
            return primo



'''
Usando las funciones podemos encontrar un primo q y otro tal que sea
impar
'''

# el parametro "entero" se refiere al valor q, es decir, a < q"entero"

#marcamos un limite para q el cual es de 65535, es decir,  0 a 2^(16)

