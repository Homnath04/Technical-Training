from entity.pet import Pet

class Dog(Pet):
    def __init__(self, name, breed, age, dog_breed):
        super().__init__(name, breed, age, "Dog")
        self.dog_breed = dog_breed

    def get_dog_breed(self):
        return self._dog_breed

    def set_dog_breed(self, dog_breed):
        self._dog_breed = dog_breed

    def __str__(self):
        return super().__str__() + f", Dog Breed: {self._dog_breed}"
