### Operadores Aritméticos ###

# Operaciones con enteros
print("suma 3+4: ",3 + 4)
print("resta 3-4: ",3 - 4)
print("multiplicación 3*4: ",3 * 4)
print("división 3/4: ",3 / 4)
print("resto 10%3: ",10 % 3)
print("División con aproximación a entero 10//3: ",10 // 3)
print("Calcular exponente 2**3: ",2 ** 3)
print("2 ** 3 + 3 - 7 / 1 // 4  :",2 ** 3 + 3 - 7 / 1 // 4)

# Operaciones con cadenas de texto
print("Hola " + "Python " + "¿Qué tal?")
print("Hola " + str(5))

# Operaciones mixtas
print("Hola " * 3)
print("Hola " * (2 ** 3))

my_float = 2.5 * 2
print("Hola " * int(my_float))

### Operadores Comparativos ###

# Operaciones con enteros
print(3 > 4) 
print(3 < 4)
print(3 >= 4)
print(4 <= 4)
print(3 == 4)
print(3 != 4)

# Operaciones con cadenas de texto
# Compara ordenación alfabética
print("# Operaciones con cadenas de texto")
print("Hola" > "Python") 
print("Hola" < "Python")
print("aaaa" >= "abaa") # Ordenación alfabética por ASCII
print(len("aaaa") >= len("abaa")) # Cuenta caracteres
print("Hola" <= "Python")
print("Hola" == "Hola")
print("Hola" != "Python")

### Operadores Lógicos ###

# Basada en el Álgebra de Boole https://es.wikipedia.org/wiki/%C3%81lgebra_de_Boole
print(3 > 4 and "Hola" > "Python") # &&
print(3 > 4 or "Hola" > "Python")  # ||
print(3 < 4 and "Hola" < "Python") 
print(3 < 4 or "Hola" > "Python")
print(3 < 4 or ("Hola" > "Python" and 4 == 4))
print(not(3 > 4)) # ! (No es)