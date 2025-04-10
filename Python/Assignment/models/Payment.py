import pyodbc
from db.db_connection import connection_db
from exception.exceptions import PaymentFailedException

class Payment:
    def __init__(self, order_id, amount, payment_method):
        self.order_id = order_id
        self.amount = amount
        self.payment_method = payment_method
        self.status = "Pending"

    def validate_payment(self):

        return self.amount > 0 and self.payment_method in ["CreditCard", "UPI", "NetBanking"]

    def process_payment(self):
        if not self.validate_payment():
            raise PaymentFailedException("Payment validation failed.")

        try:
            conn = connection_db()
            cursor = conn.cursor()

            cursor.execute("""
                INSERT INTO tecshop.PAYMENTS (ORDER_ID, AMOUNT, PAYMENT_METHOD, STATUS)
                VALUES (?, ?, ?, ?)
            """, (self.order_id, self.amount, self.payment_method, "Completed"))

            conn.commit()
            print("Payment processed and recorded successfully.")

        except pyodbc.Error as e:
            print("Database error during payment processing:", e)
            raise PaymentFailedException("Payment failed due to database error.")
        finally:
            conn.close()

