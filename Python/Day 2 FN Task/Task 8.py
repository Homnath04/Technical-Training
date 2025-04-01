while True:
    print('\nCalculator')
    print('1. Addition')
    print('2. Subtraction')
    print('3. Multiplication')
    print('4. Division')
    print('5. Quit')

    choice = input('Enter your choice (1-5): ')

    if choice == '5':
        break

    num1 = float(input('First number: '))
    num2 = float(input('Second number: '))

    if choice == '1':
        print('Result =', num1 + num2)
    elif choice == '2':
        print('Result =', num1 - num2)
    elif choice == '3':
        print('Result =', num1 * num2)
    elif choice == '4':
        print('Result =', num1 / num2)
    else:
        print('Invalid choice')