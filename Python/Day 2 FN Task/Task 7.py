num = int(input('Enter Number'))
a,b=0,1
for _ in range(num):
    print(a,end=' ')
    a,b=b,a+b