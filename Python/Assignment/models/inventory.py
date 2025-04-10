from datetime import datetime

class Inventory:
    def __init__(self, inventory_id, product, quantity):
        self.__inventory_id = inventory_id
        self.__product = product
        self.__quantity_in_stock = quantity
        self.__last_stock_update = datetime.now()

    def get_product(self): #encapsulation
        return self.__product

    def get_quantity_in_stock(self):
        return self.__quantity_in_stock

    def add_to_inventory(self, quantity):
        self.__quantity_in_stock += quantity
        self.__last_stock_update = datetime.now()

    def remove_from_inventory(self, quantity):
        if self.__quantity_in_stock < quantity:
            raise Exception("InsufficientStockException: Not enough stock.")
        self.__quantity_in_stock -= quantity
        self.__last_stock_update = datetime.now()

    def update_stock_quantity(self, new_quantity):
        if new_quantity < 0:
            raise ValueError("Quantity cannot be negative.")
        self.__quantity_in_stock = new_quantity
        self.__last_stock_update = datetime.now()

    def is_product_available(self, quantity_to_check):
        return self.__quantity_in_stock >= quantity_to_check

    def get_inventory_value(self):
        return self.__quantity_in_stock * self.__product.price
