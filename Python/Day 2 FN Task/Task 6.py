even = odd = 0
for _ in range(10):
    num = int(input('Enter The Number'))
    if num % 2 == 0:
        even += num
    else:
        odd += num

print('sum of even numbers :', even)
print('sum of odd numbers  :',odd)