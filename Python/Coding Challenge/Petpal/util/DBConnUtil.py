import pyodbc
from util.DBPropertyUtil import DBPropertyUtil

class DBConnUtil:
    @staticmethod
    def get_connection(properties_file):
        try:
            conn_str = DBPropertyUtil.get_connection_string(properties_file)
            if not conn_str:
                raise Exception("Connection string is missing in the properties file.")
            conn = pyodbc.connect(conn_str)
            return conn
        except pyodbc.Error as e:
            raise Exception(f"Database connection error: {e}")
