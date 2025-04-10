from sortedcontainers import SortedDict

class InventoryManager:
    def __init__(self):
        self.inventory = SortedDict()  # key = product_id

    def add_inventory(self, inventory):
        self.inventory[inventory.product.product_id] = inventory

    def update_stock(self, product_id, new_quantity):
        if product_id in self.inventory:
            self.inventory[product_id].update_stock_quantity(new_quantity)
        else:
            raise Exception("Product not in inventory.")

    def validate_product_availability(self, product_id, quantity):
        if product_id not in self.inventory or self.inventory[product_id].quantity_in_stock < quantity:
            raise Exception("Insufficient stock for the product.")
