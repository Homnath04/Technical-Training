import datetime
from db.db_connection import connection_db
import pyodbc


class ConcurrencyException(Exception):
    pass


def update_order_status(order_id, new_status, original_last_updated):
    conn = connection_db()
    cursor = conn.cursor()

    try:
        cursor.execute("""
            UPDATE orders
            SET status = ?, last_updated = ?
            WHERE order_id = ? AND last_updated = ?
        """, new_status, datetime.datetime.now(), order_id, original_last_updated)

        if cursor.rowcount == 0:
            raise ConcurrencyException("Order was updated by another user. Please refresh and try again.")

        conn.commit()
        print(f"Order {order_id} status updated successfully.")

    except ConcurrencyException as e:
        print("Concurrency Error:", e)

    except pyodbc.Error as db_err:
        print("Database error:", db_err)

    finally:
        conn.close()
