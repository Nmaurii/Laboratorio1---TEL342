
def previous_bbs_state(state):
    N = state[0]
    R = IntegerModRing(N)
    X = R(state[1])

    if not X.is_square():
        print('NOT valid blumblum shub')
        return None

    return [N, X.sqrt().lift()]

def encontrar_factor(x, y, N):

    factor1 = gcd(x - y, N)
    factor2 = gcd(x + y, N)

    if 1 < factor1 < N:
        return factor1
    elif 1 < factor2 < N:
        return factor2
    else:
        return None


def factorizar_con_BBS(N):

    estado_bbs = [N, randint(2, N - 1) ** 2 % N]

    estado_previo = previous_BBS_state(estado_bbs)

    if estado_previo is None:
        raise ValueError("No se pudo encontrar un estado previo válido.")

    N, x = estado_bbs
    y = estado_previo[1]
    factores = encontrar_factores_no_triviales(N, x, y)

    return factores

N = 35
x = 15
y = 10

factor = encontrar_factor(x, y, N)
print(f"Factor no trivial de N: {factor}")
