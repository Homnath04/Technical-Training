sal = float(int(input('Enter salary amount :')))
service = int(input('Enter years od Service :'))

if service >= 10:
    bonus = 0.10 * sal
elif service >= 5 and service <10:
    bonus = 0.05 * sal
elif service >= 3 and service <5:
    bonus = 0.03 * sal
else:
    bonus = 0

total_salary = bonus + sal
print('Bonus Amount : ', bonus)
print('Total salary after Bonus : ' , total_salary)
