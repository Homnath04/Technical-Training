import pyodbc

DRIVER_NAME = 'ODBC Driver 17 for SQL Server'
SERVER_NAME = 'ABI-DELL\\SQLEXPRESS'
DATABASE_NAME = 'TechShop'

def connection_db():
    connection_string = f"""
        DRIVER={{{DRIVER_NAME}}};
        SERVER={{{SERVER_NAME}}};
        DATABASE={{{DATABASE_NAME}}};
        Trusted_Connection=yes;
        TrustServerCertificate=yes;
    """
    try:
        conn = pyodbc.connect(connection_string)
        print(" Database connection successful.")
        return conn
    except pyodbc.Error as e:
        print("Failed to connect to the database:", e)
        raise
