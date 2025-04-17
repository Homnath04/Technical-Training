import pyodbc

class DBConnUtil:
    @staticmethod
    def get_connection():
        conn_str = r"Driver={ODBC Driver 17 for SQL Server};Server=ABI-DELL\SQLEXPRESS;Database=EcommerceDB;Trusted_Connection=yes;"


        return pyodbc.connect(conn_str)
