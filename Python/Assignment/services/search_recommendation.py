# search_recommendation.py

from db.db_connection import connection_db

class ProductSearch:
    def search_product(self, name):
        conn = connection_db()
        cursor = conn.cursor()
        try:
            cursor.execute("""
                SELECT * FROM tecshop.PRODUCTS 
                WHERE PROD_NAME LIKE ?
            """, (f'%{name}%',))
            return cursor.fetchall()
        except Exception as e:
            print("Error searching product:", e)
            return []
        finally:
            conn.close()
