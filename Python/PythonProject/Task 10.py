num = int(input('Enter Number :'))
original_num = num
rev = 0

if num > 0:
    while num > 0:
        digit = num % 10
        rev = (rev * 10) + digit
        num //= 10
    if original_num == rev:
        print('Palindrome Number')
    else:
        print('Not Palindrome Number')