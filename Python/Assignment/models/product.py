class Product:
    def __init__(self, product_id, name, description, price):
        self.__product_id = product_id
        self.__name = name
        self.__description = description
        self.__price = price
        self.__in_stock = 0

    @property
    def price(self):
        return self.__price

    @price.setter
    def price(self, value):
        if value < 0:
            raise ValueError("Price cannot be negative.") # ensures price cant be negative
        self.__price = value

    def get_product_details(self):
        return f"Product: {self.__name}, Description: {self.__description}, Price: {self.__price}"

    def update_product_info(self, description=None, price=None):
        if description:
            self.__description = description
        if price is not None:
            self.price = price

    def is_product_in_stock(self):
        return self.__in_stock > 0

    def set_stock(self, quantity):
        self.__in_stock = quantity
