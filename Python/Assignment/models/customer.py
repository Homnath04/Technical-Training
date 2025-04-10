class Customer:
    def __init__(self, customer_id, first_name, last_name, email, phone, address):
        self.__customer_id = customer_id  #__customer_id is a private instance variable
        self.__first_name = first_name
        self.__last_name = last_name
        self.__email = email
        self.__phone = phone
        self.__address = address
        self.__orders = [] #private order stores empty list

    @property  #decoraor
    def email(self):
        return self.__email

    @email.setter
    def email(self, value):
        if '@' not in value:
            raise ValueError("Invalid email address.")
        self.__email = value

    def calculate_total_orders(self):
        return len(self.__orders) #counts how many orders

    def get_customer_details(self):
        return f"{self.__first_name} {self.__last_name}, Email: {self.__email}, Phone: {self.__phone}, Address: {self.__address}"

    def update_customer_info(self, email=None, phone=None, address=None):
        if email:
            self.email = email
        if phone:
            self.__phone = phone
        if address:
            self.__address = address

    def add_order(self, order):
        self.__orders.append(order) #add order to cust list of order
