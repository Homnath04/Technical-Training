import pyodbc

class DBConnection:
    @staticmethod
    def get_connection():
        try:
            conn = pyodbc.connect(
                'DRIVER={ODBC Driver 17 for SQL Server};'
                'SERVER=ABI-DELL\\SQLEXPRESS;'
                'DATABASE=PetPals;'
                'Trusted_Connection=yes;'
            )
            return conn
        except Exception as e:
            print("Database connection failed:", e)
            return None
