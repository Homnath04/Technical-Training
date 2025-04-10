from db.db_connection import connection_db
from dao.customer_dao import CustomerDAO
from dao.product_dao import ProductDAO
from dao.order_dao import OrderDAO
from dao.inventory_dao import InventoryDAO
from dao.payment_dao import PaymentDAO
from services.search_recommendation import ProductSearch
from services.sales_report import SalesReport
from services.order_tracking import OrderTracking
from models.Payment import Payment
from exception.exceptions import PaymentFailedException

def main():
    conn = connection_db()

    customer_dao = CustomerDAO(conn)
    product_dao = ProductDAO(conn)
    order_dao = OrderDAO(conn)
    inventory_dao = InventoryDAO(conn)
    payment_dao = PaymentDAO(conn)

    try:
        while True:
            print("\n--- TechShop Main Menu ---")
            print("1. Register Customer")
            print("2. Add New Product")
            print("3. Place Order")
            print("4. Track Order Status")
            print("5. Update Inventory")
            print("6. Generate Sales Report")
            print("7. Update Customer Info")
            print("8. Process Payment")
            print("9. Search Product")
            print("0. Exit")

            choice = input("Enter your choice: ")

            if choice == '1':
                print("\n--- Register New Customer ---")
                customer_id = int(input("Enter Customer ID: "))
                first_name = input("Enter first name: ")
                last_name = input("Enter last name: ")
                email = input("Enter email: ")
                phone = input("Enter phone number: ")
                address = input("Enter address: ")
                customer_dao.add_customer(customer_id, first_name, last_name, email, phone, address)
                print("Customer registered successfully.")

            elif choice == '2':
                product_id = int(input("Enter Product ID: "))
                name = input("Enter product name: ")
                description = input("Enter description: ")
                try:
                    price = float(input("Enter price: "))
                    product_dao.add_product(product_id, name, description, price)
                    print("Product added successfully.")
                except ValueError:
                    print("Invalid price entered. Please enter a valid number.")

            elif choice == '3':
                try:
                    order_id = int(input("Enter Order ID: "))
                    customer_id = int(input("Enter Customer ID: "))
                    order_date = input("Enter order date (YYYY-MM-DD): ")
                    total_amount = float(input("Enter total amount: "))
                    success = order_dao.place_order(order_id, customer_id, order_date, total_amount)
                    if success:
                        print("Order placed successfully.")
                    else:
                        print("Order could not be placed.")
                except ValueError:
                    print("Invalid input. Please ensure the customer ID and total amount are valid.")

            elif choice == '4':
                order_id = int(input("Enter order ID: "))
                tracker = OrderTracking(conn)
                status = tracker.get_order_status(order_id)
                print("Order Status:", status)

            elif choice == '5':
                try:
                    product_id = int(input("Enter product ID: "))
                    new_quantity = int(input("Enter new stock quantity: "))
                    inventory_dao.update_stock(product_id, new_quantity)
                    print("Inventory updated successfully.")
                except ValueError:
                    print("Invalid input. Please enter valid product ID and stock quantity.")

            elif choice == '6':
                start_date = input("Enter start date (YYYY-MM-DD): ")
                end_date = input("Enter end date (YYYY-MM-DD): ")
                report = SalesReport()
                data = report.generate_report(start_date, end_date)
                print("\n--- Sales Report ---")
                for row in data:
                    print(row)

            elif choice == '7':
                try:
                    customer_id = int(input("Enter customer ID: "))
                    first_name = input("Enter new first name: ")
                    last_name = input("Enter new last name: ")
                    email = input("Enter new email: ")
                    phone = input("Enter new phone: ")
                    address = input("Enter new address: ")
                    customer_dao.update_customer(customer_id, first_name, last_name, email, phone, address)
                    print("Customer info updated.")
                except ValueError:
                    print("Invalid customer ID entered. Please try again.")

            elif choice == '8':
                try:
                    order_id = int(input("Enter order ID: "))
                    amount = float(input("Enter payment amount: "))
                    method = input("Enter payment method (CreditCard/UPI/NetBanking): ")
                    payment = Payment(order_id, amount, method)
                    payment.process_payment()
                    print("Payment processed successfully.")
                except PaymentFailedException as pfe:
                    print("Payment failed:", pfe)
                except ValueError:
                    print("Invalid input. Please enter a valid order ID and amount.")
                except Exception as e:
                    print("Unexpected error during payment:", e)

            elif choice == '9':
                name = input("Enter product name to search: ")
                search = ProductSearch()
                results = search.search_product(name)
                if results:
                    print("\nSearch Results:")
                    for r in results:
                        print(f"Product ID: {r[0]}, Name: {r[1]}, Description: {r[2]}, Price: {r[3]}")
                else:
                    print("No products found.")

            elif choice == '0':
                print("Exiting TechShop. Goodbye!")
                break

            else:
                print("Invalid choice. Please try again.")
    finally:
        conn.close()

if __name__ == "__main__":
    main()
