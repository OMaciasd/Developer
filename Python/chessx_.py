n=5

# DRAW.
if n > 4 and n < 7:
    for i in range(n):
        for j in range(n):
            if ((i == 0 or i == n-1 or i == n-3) 
            and (j == 0 or j == n-1 or j == n-3)) or ((i == 1 or i == n-2 or i == n-4) 
            and (j == 1 or j == n-2 or j == n-4)) or ((i == 2 or i== n-3 or i == n-5) 
            and (j == 2 or j == n-3 or j == n-5)):
                print('X', end='')
            else:
                print('_', end='')
        print('')

# PRINT.	
else:
    print('ERROR')
