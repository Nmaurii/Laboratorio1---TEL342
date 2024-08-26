︠c54588c6-80a0-4d8d-97a5-789241252586s︠
def convertir_numero(letra):
    return ord(letra.lower())-97


def ataque_cifrado_hill(texto_plano, texto_cif):

    palabras_por_particion = 2
    cant_particiones = math.ceil(len(texto_cif) / palabras_por_particion)
    particiones_cif = []
    particiones_pl = []

    nletracif = 0
    nletrapl = 0
    a = 0
    fila_cif = []
    fila_pl = []
    matriz_cif = []
    matriz_pl = []

    mcif_inv = []
    mpl_inv = []
    Key = []
    posibles_k = []

    for i in range(cant_particiones):
        particiones_cif.append(texto_cif[i*palabras_por_particion: (i+1)*palabras_por_particion])
        particiones_pl.append(texto_plano[i*palabras_por_particion: (i+1)*palabras_por_particion])
    
    for i in range(cant_particiones):
        

        for j in range(len(particiones_cif[i])):
            
            
            if(a >= len(texto_plano)):
                
                if(a%2 != 0):
                    fila_pl.append(23)

                else:
                    fila_pl.append(23)

            else:

                nletrapl = convertir_numero(particiones_pl[i][j])
                fila_pl.append(nletrapl)

            nletracif = convertir_numero(particiones_cif[i][j])
            fila_cif.append(nletracif)
            
            a += 1

        matriz_cif.append(fila_cif)
        fila_cif = []

        matriz_pl.append(fila_pl)
        fila_pl = []
        

    matriz_pl = Matrix(ZZ, matriz_pl)
    matriz_cif = Matrix(ZZ, matriz_cif)

    for i in range(cant_particiones):

        mcif_inv = matriz_cif[i:i+2]
        mpl_inv = matriz_pl[i:i+2]

        if (mcif_inv.nrows() == 2):

            determinante_pl = mpl_inv.det()
            determinante_cif = mcif_inv.det()


            if((determinante_cif != 0 and determinante_pl != 0) and (mpl_inv.determinant()%2 != 0 and mpl_inv.determinant()%13 != 0) and (mcif_inv.determinant()%2 != 0 and mcif_inv.determinant()%13 != 0)):

                det_inverso = (1/mpl_inv.determinant())%26

                mpl_inv = (det_inverso * mpl_inv.adjugate()%26)%26

                Key = mpl_inv*mcif_inv
                posibles_k.append(Matrix(ZZ,(Key%26)))

    return posibles_k


print(ataque_cifrado_hill("friday", "izrvey"))
print("")

print(ataque_cifrado_hill("diamondisinstatue", "zisxlhdiwdingthyqq"))
print("")

print(ataque_cifrado_hill("hesecretdietistofuhotdogs", "qbayzelwilksscipqpsvkafvssyy"))
print("")

︡bea03c1c-1895-4e87-8a9b-784bf9792e6b︡{"stdout":"[[11 12]\n[11  1]]\n"}︡{"stdout":"\n"}︡{"stdout":"[[11 20]\n[19 13]]\n"}︡{"stdout":"\n"}︡{"stdout":"[[14 19]\n[25  4]]\n"}︡{"stdout":"\n"}︡{"done":true}
︠920fc6ca-2bf8-47e0-8d78-4458483766c8︠









