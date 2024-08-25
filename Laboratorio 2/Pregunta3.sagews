palabra = 'ztmn pxtne cfa peqef kecnp cjt tmn zcwsenp ontmjsw ztnws tf wsvp xtfwvfefw, c feb fcwvtf, xtfxevqea vfgvoenwk, cfa aeavxcwea wt wse rntrtpvwvtf wscw cgg lef cne xnecwea eymcg.'
def frecuencias(palabra):
    veces = {
        chr(97 + _):0 for _ in range(26)
    }
    cantidad = 0

    for letra in palabra:
        if (ord(letra.lower()) >= 97 and ord(letra.lower()) <= 122):
            veces[letra.lower()] += 1
            cantidad += 1

    histograma = [ (letra, int(vez) / int(cantidad)) for letra, vez in veces.items()]

    return sorted(histograma, key=lambda x: x[1],reverse=True)


def sustitucion(palabra, frecuencia):

    #frecuencia = frecuencias(palabra)
    cambio = [
        'e' if letra == frecuencia[0][0]
        else 't' if letra == frecuencia[1][0]
        else 'a' if letra == frecuencia[2][0]
        else '_'
        for letra in palabra
    ]
    return ''.join(cambio)

def union_final(palabra,descifrado):

    union = [ palabra[_].upper() if descifrado[_] == '_' else descifrado[_] for _ in range(len(palabra))]

    return ''.join(union)

#====Frecuencias uso de funcion frecuencias, item 1
print('Frecuencias. \n')
print(frecuencias(palabra))

#====Sustitucion uso de funcion sustitucion, item 2

print('\nSustitucion. \n')
print(sustitucion(palabra,frecuencias(palabra)))

#====Union final uso de funcion union final, item 2

print('\nUnion final. \n')
print(union_final(palabra,sustitucion(palabra,frecuencias(palabra))))
