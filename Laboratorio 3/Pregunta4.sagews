︠d87266b6-e9ad-46cf-a4a7-42f63c92d587s︠
#Pregunta 4 Lab 3

import time

def random_prime(m):
    
    n_max = 2^(m)
    n_min = 2^(m)-5000
    
    primo_guardado = 0
    next_primo = 0
    flag = True
    
    lista = list(primes(n_min, n_max))
    
    return lista[len(lista)-1]
    
def menor_p(p):
    
    return randint(0, p)
       

def ModExp(a, e, p):
    
    n_elevado = a^p
    calculo = n_elevado%(e)
    
    return calculo
    
def medir_tiempo(a,e,p):
    
    for i in range(4):
        
        tiempo_i = time.time()

        ModExp(a,e,p)

        tiempo_f = time.time()
        
        print("Han transcurrido:", tiempo_f - tiempo_i, "[s]")
    
n = 1   #Valor configurable
m = 2   #Valor configurable


p = random_prime(m)
a = menor_p(p)
e = 2^(n)

medir_tiempo(a,e,p)

n = 2   #Valor configurable
m = 5   #Valor configurable

print("-----Cambio de las variables-----")

medir_tiempo(a,e,p)

n = 4   #Valor configurable
m = 10   #Valor configurable
p = random_prime(m)
a = menor_p(p)

print("-----Cambio de las variables-----")

medir_tiempo(a,e,p)

n = 8   #Valor configurable
m = 15   #Valor configurable
p = random_prime(m)
a = menor_p(p)

print("-----Cambio de las variables-----")

medir_tiempo(a,e,p)
︡c0fb3f94-2027-4430-9d0a-b04423008a64︡{"stdout":"Han transcurrido: 5.0067901611328125e-06 [s]\nHan transcurrido: 1.9073486328125e-06 [s]\nHan transcurrido: 9.5367431640625e-07 [s]\nHan transcurrido: 9.5367431640625e-07 [s]\n"}︡{"stdout":"-----Cambio de las variables-----\n"}︡{"stdout":"Han transcurrido: 9.775161743164062e-06 [s]\nHan transcurrido: 2.1457672119140625e-06 [s]\nHan transcurrido: 1.6689300537109375e-06 [s]\nHan transcurrido: 1.1920928955078125e-06 [s]\n"}︡{"stdout":"-----Cambio de las variables-----\n"}︡{"stdout":"Han transcurrido: 4.2438507080078125e-05 [s]\nHan transcurrido: 2.574920654296875e-05 [s]\nHan transcurrido: 2.47955322265625e-05 [s]\nHan transcurrido: 2.4318695068359375e-05 [s]\n"}︡{"stdout":"-----Cambio de las variables-----\n"}︡{"stdout":"Han transcurrido: 0.012145280838012695 [s]\nHan transcurrido: 0.011779069900512695 [s]\nHan transcurrido: 0.011592388153076172 [s]\nHan transcurrido: 0.011478424072265625 [s]\n"}︡{"done":true}









