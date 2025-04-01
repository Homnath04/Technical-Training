a = int(input('Enter value a :'))
b = int(input('Enter value b :'))
operator = input('Enter operator [+,-,/,*,%]')

match operator:
    case '+':
        print('Result a+b :',a + b )
    case '-':
        print('Result a-b :', a-b)
    case '/':
        print('Result a/b :' ,a/b )
    case '*':
        print('Result a*b :',a*b)
    case '%':
        print('Result a%b :', a%b)
    case _:
        print('Invalid operator')