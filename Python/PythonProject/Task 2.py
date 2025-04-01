from math import *
a = float(input('Enter coefficient a : '))
b = float(input('Enter coefficient b : '))
c = float(input('Enter coefficient c : '))

discriminant = b ** 2 - 4*a*c

if discriminant > 0:
    root1 = (-b + sqrt(discriminant)) / (2*a)
    root2 = (-b - sqrt(discriminant)) / (2*a)
    print('Real and Distinct roots ', root1, root2)
elif discriminant == 0:
    root = -b/(2*a)
    print('Real and Equal roots ' ,root )
else:
    real_part = -b/(2*a)
    imaginary_part = sqrt(abs(discriminant)) / (2*a)
    print('Imaginary Roots ' , real_part + imaginary_part)