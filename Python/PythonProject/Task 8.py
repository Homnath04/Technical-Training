num = int(input("Enter Number :"))
original_num = num
num_digit = len(str(num))
sum_power = 0

while num > 0:
    digit = num % 10
    sum_power += digit ** num_digit
    num //= 10

if sum_power == original_num:
    print(original_num , 'is an Armstrong num ')
else:
    print('Not an Armstrong num')
