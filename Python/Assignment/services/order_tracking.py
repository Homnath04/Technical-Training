class OrderTracking:
    def __init__(self, conn=None):
        self.conn = conn or connection_db()
        self.cursor = self.conn.cursor()

    def get_order_status(self, order_id):
        try:
            self.cursor.execute("""
                SELECT ORDER_DATE, TOTAL_AMOUNT FROM tecshop.ORDERS WHERE ORDER_ID = ?
            """, (order_id,))
            result = self.cursor.fetchone()
            if result:
                return f"Order Date: {result[0]}, Total Amount: {result[1]}"
            else:
                return "Order not found."
        except Exception as e:
            print(f"Error tracking order: {e}")
