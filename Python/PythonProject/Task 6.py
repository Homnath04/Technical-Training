import math

print("Choose a shape to calculate area:")
print("1. Circle")
print("2. Triangle (using Heron's Formula)")
print("3. Rectangle")

choice = int(input("Enter your choice (1/2/3): "))

match choice:
    case 1:
        radius = float(input("Enter the radius of the circle: "))
        area = math.pi * radius ** 2
        print(f"Area of the circle: {area:.2f}")

    case 2:
        a = float(input("Enter the first side of the triangle: "))
        b = float(input("Enter the second side of the triangle: "))
        c = float(input("Enter the third side of the triangle: "))

        # Heron's formula
        s = (a + b + c) / 2
        area = math.sqrt(s * (s - a) * (s - b) * (s - c))
        print(f"Area of the triangle: {area:.2f}")

    case 3:
        length = float(input("Enter the length of the rectangle: "))
        width = float(input("Enter the width of the rectangle: "))
        area = length * width
        print(f"Area of the rectangle: {area:.2f}")

    case _:
        print("Invalid choice! Please enter 1, 2, or 3.")
