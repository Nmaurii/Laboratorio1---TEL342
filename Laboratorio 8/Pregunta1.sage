class Comunicacion:
    '''
    Se definen los atributos de la clase, donde tenemos publicos y rpvados
    '''
    def __init__(self,nombre,p,g):

        self.nombre = nombre #se define nombre del dueno de claves
        self.__p = p    #valor p primo publico
        self.__g = g    #valor g raiz primitiva de Zp
        self.__valores_secretos = self.__generador_aleatorio(3) #valores para clave publica
        self.__clave_privada = self.__generador_aleatorio(1)[0] # clave privada
        self.clave_publica = self.__generador_clave_publica()
    
    def __str__(self):
        return "Nombre: {0}\np : {1} y g: {2} \nValores secretos: {3}".format(self.nombre,self.__p,self.__g,self.__valores_secretos)
    #setters los setters seran privados por temas de seguridad
    '''
    Este generador funciona con una largo varible de valores secretos x,z e y utilizados para la clave publica
    '''
    def __generador_aleatorio(self,final,i=0):

        valores = []
        while i < final:
            numero = randint(1,self.__p-2) 
            if (numero not in valores):
                valores.append(numero)
                i+=1
        return tuple(valores)

    def __generador_clave_publica(self):
        x,y,z = self.__valores_secretos
        P = pow(self.__g,(self.__clave_privada+z)) % self.__p
        Q = pow(self.__g,(y+z)) % self.__p
        return P,Q

    def generador_clave_secreta_compartida_intermedia(self,P,Q):
        return pow(P,self.__clave_privada+self.__valores_secretos[2])*pow(Q,self.__valores_secretos[1]+self.__valores_secretos[2]) % self.__p
    
        
    def inverso_multiplicativo(self):
        return 1/(self.__valores_secretos[0] + self.__valores_secretos[1])

    #getters acceso a informacion publica como clave publica
    def get_clave_publica(self):
        return self.clave_publica

# valores de p = 23 y g = 5 son buenos

Alice = Comunicacion("Alice",23,5)
Bob   = Comunicacion("Bob",23,5)

P1,Q1 = Alice.get_clave_publica()
P2,Q2 = Bob.get_clave_publica()

print(Alice.generador_clave_secreta_compartida_intermedia(P2,Q2))
print(Bob.generador_clave_secreta_compartida_intermedia(P1,Q1))

#print(Alice.get_clave_publica())

#print(Bob.generador_clave_secreta_compartida(P,Q))
