from db.db_connection import connection_db

class PaymentDAO:
    def __init__(self, conn=None):
        self.conn = conn or connection_db()
        self.cursor = self.conn.cursor()

    def add_payment(self, order_id, amount, method):
        try:
            query = """
                INSERT INTO tecshop.PAYMENTS (ORDER_ID, AMOUNT, PAYMENT_METHOD, STATUS)
                VALUES (?, ?, ?, 'Completed')
            """
            self.cursor.execute(query, (order_id, amount, method))
            self.conn.commit()
            print("Payment added successfully.")
        except Exception as e:
            print("Error adding payment:", e)
            self.conn.rollback()

    def get_all_payments(self):
        try:
            self.cursor.execute("SELECT * FROM tecshop.PAYMENTS")
            return self.cursor.fetchall()
        except Exception as e:
            print("Error fetching payments:", e)
            return []

    def record_payment(self, order_id, amount, method):
        try:
            self.cursor.execute("""
                INSERT INTO tecshop.PAYMENTS (ORDER_ID, AMOUNT, PAYMENT_METHOD, STATUS)
                VALUES (?, ?, ?, 'Completed')
            """, (order_id, amount, method))
            self.conn.commit()
            print("Payment recorded successfully.")
        except Exception as e:
            print("Error recording payment:", e)
            self.conn.rollback()
