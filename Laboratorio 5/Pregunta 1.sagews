︠ed8c81c1-8543-42f6-855c-da00b29ccdf8︠
def random_prim(bits):

    n_max = 2**(bits) - 1
    n_min = 2**(bits - 1)

    primo = random_prime(n_max, lbound=n_min)

    return primo

def generate_simple_hash_params(n):

    #p y q deben ser de la mitad de bits que N para que N nunca sobrepase la cantidad de bits
    p = random_prim(n//2)
    q = random_prim(n//2)

    N = p * q

    while True:
        g = randint(2, N - 1)
        if gcd(g, N) == 1:
            break

    return N, g


def generate_hasheo_simple (N, g, n):

    H = power_mod(g, n, N)

    return H

def buscar_colision(p, q):
    N = p * q
    phi_N = (p - 1) * (q - 1)
    
    while True:
        g = randint(2, N - 1)
        if gcd(g, N) == 1:
            break
    
    colision_encontrada = False
    
    while not colision_encontrada:
        m = randint(2, N - 1)
        n = randint(2, N - 1)
        
        hash_m = power_mod(g, m, N)
        hash_n = power_mod(g, n, N)
        
        if hash_m == hash_n:
            colision_encontrada = True
    
    return (g, m, n, hash_m, hash_n)




print("\n////////////////////////////////////\n")

N, g = generate_simple_hash_params(16)
print ("con 16 bits, N:", N)
print ("con 16 bits, g:", g)

N, g = generate_simple_hash_params(64)
print ("con 64 bits, N:", N)
print ("con 64 bits, g:", g)

N, g = generate_simple_hash_params(128)
print ("con 128 bits, N:", N)
print ("con 128 bits, g:", g)

print("\n////////////////////////////////////\n")

print("Hasheo (Pregunta d)")
print(generate_hasheo_simple(600107, 154835, 239715))
print("Hasheo (Pregunta e)")
print(generate_hasheo_simple(548155966307, 189830397891, 44344313866))
print("Hasheo (Pregunta f)")
print(generate_hasheo_simple(604766153, 12075635, 443096843))


print("\n////////////////////////////////////\n")

print("prueba para g:")

p = 61  # Primer número primo
q = 53  # Segundo número primo

g, m, n, hash_m, hash_n = buscar_colision(p, q)
print(f"g = {g}, m = {m}, n = {n}")
print(f"Hash de m: {hash_m}")
print(f"Hash de n: {hash_n}")
print(f"¿Colisión encontrada? {hash_m == hash_n}")

︡4218453e-df88-41c1-a494-dc4490e49c20︡{"stdout":"\n////////////////////////////////////\n\n"}︡{"stdout":"con 16 bits, N: 22657\n"}︡{"stdout":"con 16 bits, g: 18687\n"}︡{"stdout":"con 64 bits, N: 7740229533692881409\n"}︡{"stdout":"con 64 bits, g: 6349280443202925341\n"}︡{"stdout":"con 128 bits, N: 260018044823064677494419506527717278719\n"}︡{"stdout":"con 128 bits, g: 187975340957741436782612127159589997354\n"}︡{"stdout":"\n////////////////////////////////////\n\n"}︡{"stdout":"Hasheo (Pregunta d)\n"}︡{"stdout":"565219\n"}︡{"stdout":"Hasheo (Pregunta e)\n"}︡{"stdout":"499803692828\n"}︡{"stdout":"Hasheo (Pregunta f)\n"}︡{"stdout":"290266411\n"}︡{"stdout":"\n////////////////////////////////////\n\n"}︡{"stdout":"prueba para g:\n"}︡{"stdout":"g = 690, m = 2593, n = 373\n"}︡{"stdout":"Hash de m: 2916\n"}︡{"stdout":"Hash de n: 2916\n"}︡{"stdout":"¿Colisión encontrada? True\n"}︡{"done":true}
︠8699071f-72e8-4b52-ba1e-9da52bf9ba6f︠

︡1ba04df0-f1f6-479a-a71a-7b8438c4acf0︡{"done":true}
︠661af84e-5295-4953-9103-657ac353437d︠

︡ead8261d-5cd9-44ef-baf7-bc376efd4fa6︡{"done":true}
︠0a28c299-b01d-4834-ae7d-3dc3045c1ef1s︠

︡508802eb-e6da-4863-a771-c3eac9843835︡{"done":true}









