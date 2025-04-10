from datetime import datetime

class Order:
    def __init__(self, order_id, customer):
        self.__order_id = order_id
        self.__customer = customer
        self.__order_date = datetime.now()
        self.__total_amount = 0.0
        self.__status = "Processing"
        self.__order_details = []

    def calculate_total_amount(self):
        self.__total_amount = sum(od.calculate_subtotal() for od in self.__order_details) #cal total ord by sum subtotal of eaxh
        return self.__total_amount

    def get_order_details(self):
        details = [od.get_order_detail_info() for od in self.__order_details]
        return f"Order ID: {self.__order_id}, Date: {self.__order_date}, Total: {self.__total_amount}\n" + "\n".join(details)

    def update_order_status(self, status):
        self.__status = status

    def cancel_order(self):
        self.__status = "Cancelled"
        for detail in self.__order_details:
            detail.product.set_stock(detail.product.get_stock() + detail.quantity) #cancel order and restore stock

    def add_order_detail(self, order_detail):
        self.__order_details.append(order_detail)
