from math import remainder

num = int(input("Enter the Number :"))
binary = ''
original_num = num

if num == 0:
    binary = '0'
else:
    while num > 0:
        remainder = num % 2
        binary = str(remainder) + binary
        num //= 2

print('Binary Equivalent of ' , original_num , ' is ' , binary)