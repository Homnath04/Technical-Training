from dao.DBConnection import DBConnection

class PetDAO:
    @staticmethod
    def get_all_pets():
        pets = []
        try:
            conn = DBConnection.get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT PetID, Name, Breed, Age, Type FROM Pets WHERE AvailableForAdoption=1")
            for row in cursor.fetchall():
                pets.append({
                    "PetID": row.PetID,
                    "Name": row.Name,
                    "Age": row.Age,
                    "Breed": row.Breed,
                    "Type": row.Type
                })
            cursor.close()
            conn.close()
        except Exception as e:
            print("Error fetching pets:", e)
        return pets

    @staticmethod
    def add_pet(pet):
        try:
            # Extract attributes from the pet object
            name = pet.get_name()
            breed = pet.get_breed()
            age = pet.get_age()
            pet_type = pet.pet_type

            # Database insertion logic
            conn = DBConnection.get_connection()
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO Pets (Name, Breed, Age, Type) VALUES (?, ?, ?, ?)",
                (name, breed, age, pet_type)
            )
            conn.commit()
            cursor.close()
            conn.close()
            print("Pet added successfully.")
        except Exception as e:
            print("Error adding pet:", e)


