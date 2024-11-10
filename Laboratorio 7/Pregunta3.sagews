︠4dc618f4-984f-4492-9c32-2c9445012b82s︠
        #PROBLEMA 3

    #Pregunta a
    
p = 499
g = 7
X = 297

F = GF(p)
x = F(X).log(F(g))

print("Pregunta A")
print(f"El valor x obtenido por logaritmo discreto es: " + str(x))


    #Pregunta b
    
p = 863
g = 5
X = 543
Y = 239

F = GF(p)

x = F(X).log(F(g))
y = F(Y).log(F(g))

print("\n")
print("Pregunta B")
print(f"Los valores secretos de cada sujeto son: 'x'={x} e 'y'={y}")


    #Pregunta c Encontrar K
    
p = 7589
g = 2
X = 6075
Y = 1318

F = GF(p)

x = F(X).log(F(g))
y = F(Y).log(F(g))

print("\n")
print("Pregunta C")
print("Para comprobar, usar ambos casos")

K1 = (X^y)%p
K2 = (Y^x)%p

print(f"K1 = {K1} y K2 = {K2}, lo que indica que esta correcto")
︡c5a36022-d244-4cb9-9850-b3f91ec8d7c9︡{"stdout":"Pregunta A\n"}︡{"stdout":"El valor x obtenido por logaritmo discreto es: 362\n"}︡{"stdout":"\n\n"}︡{"stdout":"Pregunta B\n"}︡{"stdout":"Los valores secretos de cada sujeto son: 'x'=536 e 'y'=762\n"}︡{"stdout":"\n\n"}︡{"stdout":"Pregunta C\n"}︡{"stdout":"Para comprobar, usar ambos casos\n"}︡{"stdout":"K1 = 6803 y K2 = 6803, lo que indica que esta correcto\n"}︡{"done":true}









