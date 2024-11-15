class Comunicacion:

    def __init__(self,nombre,p,g):
        self.__nombre = nombre #se define nombre del dueno de claves
        self.__p = p    #valor p primo publico
        self.__g = g    #valor g raiz primitiva de Zp
        self.__valores_secretos = self.generador_aleatorio()
    
    def __str__(self):
        return "Nombre: {0}\p : {1} y g: {2} \nValores secretos: {3}".format(self.__nombre,self.__p,self.__g,self.__valores_secretos)
    
    def generador_aleatorio(self,i=0):

        valores = []
        while i < 3:
            numero = randint(1,self.__p-2) 
            if (numero not in valores):
                valores.append(numero)
                i+=1
        return valores[0],valores[1],valores[2]
    
    def clave_publica(self):
        x,y,z = self.generador_aleatorio()
        P = pow(self.__g,(x+z)) % self.__p
        Q = pow(self.__g,(y+z)) % self.__p
        return P,Q

    #def generador_clave_privada():


# valores de p = 23 y g = 5 son buenos

Alice = Comunicacion("Alice",23,5)


print(Alice)
