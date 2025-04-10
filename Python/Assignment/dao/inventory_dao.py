from db.db_connection import connection_db

class InventoryDAO:
    def __init__(self, conn=None):
        self.conn = conn or connection_db()
        self.cursor = self.conn.cursor()

    def get_all_inventory(self):
        self.cursor.execute("SELECT * FROM tecshop.INVENTORY")
        return self.cursor.fetchall()

    def update_stock(self, product_id, new_quantity):
        try:
            self.cursor.execute("""
                UPDATE tecshop.INVENTORY SET QuantityInStock = ?
                WHERE PROD_ID = ?
            """, (new_quantity, product_id))
            self.conn.commit()
        except Exception as e:
            print("Error updating inventory:", e)

        finally:
            self.conn.close()
