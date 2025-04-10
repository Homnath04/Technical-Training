from db.db_connection import connection_db

class SalesReport:
    def __init__(self, conn=None):
        self.conn = conn or connection_db()
        self.cursor = self.conn.cursor()

    def generate_report(self, start_date, end_date):
        try:
            self.cursor.execute("""
                SELECT * FROM tecshop.ORDERS
                WHERE ORDER_DATE BETWEEN ? AND ?
            """, (start_date, end_date))
            return self.cursor.fetchall()
        except Exception as e:
            print("Error generating report:", e)
            return []
