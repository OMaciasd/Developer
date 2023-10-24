myArray = [1,2,1,3,3,1,2,1,5,1]

maximo= max(myArray)
for i in range(1, maximo + 1):          # Recorro de 1 a 5 para ver cuántas veces se repite cada valor.
    print(i,":","*" * myArray.count(i)) # La i tiene el valor y count las veces que se repite.
