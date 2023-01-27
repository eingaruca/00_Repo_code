# Variables

my_string = 'Texto de Prueba'
my_int = 4
my_boolean = True
my_int_to_string = str(my_int)
print(my_string)
print(my_int)
print(my_boolean)

print("----> ",my_string,my_int,my_boolean)
print("type de my_int_to_string es: ",type(my_int_to_string))
print("Leng de my_string es : ",len(my_string))

# Variables en una sola línea. ¡Cuidado con abusar de esta sintaxis!
name, surname, alias, age = "Eldo", "Ing", 'eingaruca', 36
print("Me llamo:", name, surname, ". Mi edad es:", age, ". Y mi alias es:", alias)

# Inputs
name = input('¿Cuál es tu nombre? ')
age = input('¿Cuántos años tienes? ')
print(name)
print(age)


# Cambiamos el valor y tipo de las variables
name = 35
age = "Brais"
print(name)
print(age)


# ¿Forzamos el tipo?
address: str = "Mi dirección"
address = True
address = 5
address = 1.2
print(type(address))


