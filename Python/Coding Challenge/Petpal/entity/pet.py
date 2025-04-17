class Pet:
    def __init__(self, name, age, breed, pet_type):
        self._name = name
        self._age = age
        self._breed = breed
        self.pet_type = pet_type
        self.available_for_adoption = True

    # Getter and Setter methods for name, age, breed
    def get_name(self):
        return self._name

    def set_name(self, name):
        self._name = name

    def get_age(self):
        return self._age

    def set_age(self, age):
        self._age = age

    def get_breed(self):
        return self._breed

    def set_breed(self, breed):
        self._breed = breed

    # String representation
    def __str__(self):
        return f"{self.pet_type} - {self._name}, Age: {self._age}, Breed: {self._breed}"
