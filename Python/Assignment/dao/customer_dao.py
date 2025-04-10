from db.db_connection import connection_db
class CustomerDAO:
    def __init__(self, conn=None):
        self.conn = conn or connection_db()
        self.cursor = self.conn.cursor()

    def get_all_customers(self):
        self.cursor.execute("SELECT * FROM tecshop.CUSTOMER")
        return self.cursor.fetchall()

    def add_customer(self, customer_id,first_name, last_name, email, phone, address):
        try:

            self.cursor.execute("""
                INSERT INTO tecshop.CUSTOMER (CUST_ID, F_NAME, L_NAME, EMAIL, PHONE, ADDRESS)
                VALUES (?, ?, ?, ?, ?, ?)
            """, (customer_id,first_name, last_name, email, phone, address))

            self.conn.commit()
        except Exception as e:
            print(f"Error adding customer: {e}")
            self.conn.rollback()

    def update_customer(self, customer_id, first_name, last_name, email, phone, address):
        try:
            self.cursor.execute("""
                UPDATE tecshop.CUSTOMER 
                SET F_NAME = ?, L_NAME = ?, EMAIL = ?, PHONE = ?, ADDRESS = ?
                WHERE CUST_ID = ?
            """, (first_name, last_name, email, phone, address, customer_id))
            self.conn.commit()
        except Exception as e:
            print(f"Error updating customer: {e}")
            self.conn.rollback()

