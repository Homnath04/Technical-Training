from entity.pet import Pet

class Cat(Pet):
    def __init__(self, name, age, breed, cat_color):
        super().__init__(name, age, breed, "Cat")
        self.cat_color = cat_color

    def get_cat_color(self):
        return self._cat_color

    def set_cat_color(self, cat_color):
        self._cat_color = cat_color

    def __str__(self):
        return super().__str__() + f", Cat Color: {self._cat_color}"
