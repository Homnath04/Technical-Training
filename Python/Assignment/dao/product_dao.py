# product_dao.py

import pyodbc
from db.db_connection import connection_db

class ProductDAO:
    def __init__(self, conn=None):
        self.conn = conn or connection_db()
        self.cursor = self.conn.cursor()

    def get_all_products(self):
        self.cursor.execute("SELECT * FROM tecshop.PRODUCTS")
        return self.cursor.fetchall()

    def add_product(self, product_id, name, description, price):
        try:
            self.cursor.execute(
                "INSERT INTO tecshop.PRODUCTS (PROD_ID, PROD_NAME, DESCRIPTION, PRICE) VALUES (?, ?, ?, ?)",
                (product_id, name, description, price)
            )
            self.conn.commit()
        except Exception as e:
            print("Error adding product:", e)

