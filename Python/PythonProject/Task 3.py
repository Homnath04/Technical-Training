mark1 = int(input('Enter mark 1 '))
mark2 = int(input('Enter mark 2 '))
mark3 = int(input('Enter mark 3 '))

avg = (mark1+mark2+mark3)/3
print('Average mark ' , avg)

if avg >= 80:
    print('Grade A')
elif avg >=70 and avg<= 79:
    print('Grade B')
elif avg >=60 and avg<= 69:
    print('Grade c')
else:
    print('Fail')
