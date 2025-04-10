from db_connection import connection_db

class AccountUpdate:
    def update_email_phone(self, customer_id, new_email, new_phone):
        conn = connection_db()
        cursor = conn.cursor()
        try:
            cursor.execute("""
                UPDATE Customers SET EMAIL = ?, PHONE = ?
                WHERE CUSTOMER_ID = ?
            """, (new_email, new_phone, customer_id))
            conn.commit()
        except Exception as e:
            print("Error updating customer info:", e)
        finally:
            conn.close()
