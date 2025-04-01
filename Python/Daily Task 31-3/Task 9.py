p = float(input('Enter principle amount'))
r = float(input('Enter the annual intrest rate (in %)'))
t = float(input('Enter the Time period (in yr)'))

A = p * (1 + r / 100) ** t
CI = A-p

print('Compound Intrest ' , CI)
print('Total Amount payable ', A)