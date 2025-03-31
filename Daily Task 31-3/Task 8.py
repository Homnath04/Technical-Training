p = float(input('Enter principle amount'))
r = float(input('Enter the annual intrest rate (in %)'))
t = float(input('Enter the Time period (in yr)'))

SI = (p+r+t) / 100
total_amount = SI + p
print('Simple intrest is ', SI)
print('Total amount after SI is ', total_amount )