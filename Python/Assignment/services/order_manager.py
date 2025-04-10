class ProductManager:
    def __init__(self):
        self.products = []

    def add_product(self, product):
        if any(p.product_id == product.product_id for p in self.products):
            raise Exception("Duplicate product ID.")
        self.products.append(product)

    def update_product(self, product_id, new_price=None, new_description=None):
        for p in self.products:
            if p.product_id == product_id:
                if new_price is not None:
                    p.price = new_price
                if new_description is not None:
                    p.description = new_description
                return
        raise Exception("Product not found.")

    def remove_product(self, product_id):
        self.products = [p for p in self.products if p.product_id != product_id]

    def search_products_by_name(self, name):
        return [p for p in self.products if name.lower() in p.product_name.lower()]
