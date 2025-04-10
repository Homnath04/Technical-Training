from db.db_connection import connection_db

class OrderDAO:
    def __init__(self, conn=None):
        self.conn = conn or connection_db()
        self.cursor = self.conn.cursor()

    def get_all_orders(self):
        self.cursor.execute("SELECT * FROM tecshop.ORDERS")
        return self.cursor.fetchall()

    def place_order(self, order_id, customer_id, order_date, total_amount):
        try:
            # Optional: Validate customer existence
            self.cursor.execute("SELECT COUNT(*) FROM tecshop.CUSTOMER WHERE CUST_ID = ?", (customer_id,))
            if self.cursor.fetchone()[0] == 0:
                print(f" Customer ID {customer_id} does not exist. Cannot place order.")
                return

            self.cursor.execute("""
                INSERT INTO tecshop.ORDERS (ORDER_ID, CUST_ID, ORDER_DATE, TOTAL_AMOUNT)
                VALUES (?, ?, ?, ?)
            """, (order_id, customer_id, order_date, total_amount))
            self.conn.commit()
            print(" Order placed successfully.")
        except Exception as e:
            print("Error placing order:", e)
