class PetShelter:
    def __init__(self):
        self._available_pets = []

    def add_pet(self, pet):
        self._available_pets.append(pet)

    def remove_pet(self, pet):
        if pet in self._available_pets:
            self._available_pets.remove(pet)

    def list_available_pets(self):
        if not self._available_pets:
            print("No pets available.")
        for pet in self._available_pets:
            try:
                print(pet)
            except Exception:
                print("Incomplete pet information.")
