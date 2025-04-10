from exceptions import IncompleteOrderException
class OrderDetail:
    def __init__(self, order_detail_id, order, product, quantity):
        if product is None:
            raise IncompleteOrderException("Order detail must have a valid product.")
        self.__order_detail_id = order_detail_id
        self.__order = order
        self.__product = product
        self.__quantity = quantity
        self.__discount = 0.0

    def calculate_subtotal(self):
        return (self.__product.price * self.__quantity) * (1 - self.__discount) #cal subtotal cost of specific item

    def get_order_detail_info(self):
        return f"{self.__product.get_product_details()} | Quantity: {self.__quantity} | Subtotal: {self.calculate_subtotal()}"

    def update_quantity(self, quantity):
        if quantity <= 0:
            raise ValueError("Quantity must be positive.") #update qunatity of prod
        self.__quantity = quantity

    def add_discount(self, discount):
        if not (0 <= discount < 1):
            raise ValueError("Discount must be between 0 and 1.")
        self.__discount = discount
