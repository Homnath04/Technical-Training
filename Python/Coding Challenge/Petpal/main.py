from dao.PetDAO import PetDAO
from dao.DonationDAO import DonationDAO
from dao.AdoptionEventDAO import AdoptionEventDAO

from entity.cash_donation import CashDonation
from entity.item_donation import ItemDonation
from entity.dog import Dog
from entity.cat import Cat

from util.ValidationUtil import ValidationUtil

from exception.InvalidAgeException import InvalidAgeException
from exception.NullReferenceException import NullReferenceException
from exception.InsufficientFundsException import InsufficientFundsException
from exception.AdoptionException import AdoptionException

def main_menu():
    pet_dao = PetDAO()
    donation_dao = DonationDAO()
    event_dao = AdoptionEventDAO()

    while True:
        print("\n====== PetPals Adoption Platform ======")
        print("1. Add New Pet")
        print("2. Display Available Pets")
        print("3. Record Cash Donation")
        print("4. Record Item Donation")
        print("5. Display Upcoming Adoption Events")
        print("6. Register Participant for Event")
        print("0. Exit")

        choice = input("Enter your choice: ")

        try:
            if choice == '1':
                name = input("Enter pet name: ")
                breed = input("Enter breed: ")
                pet_type = input("Enter pet type (Dog/Cat): ")

                age = int(input("Enter age: "))
                ValidationUtil.validate_age(age)
                ValidationUtil.validate_not_null(name, "Name")
                ValidationUtil.validate_not_null(breed, "Breed")

                if pet_type.lower() == "dog":
                    dog_breed = input("Enter specific dog breed: ")
                    pet = Dog(name, age, breed, dog_breed)
                elif pet_type.lower() == "cat":
                    cat_color = input("Enter cat color: ")
                    pet = Cat(name, age, breed, cat_color)
                else:
                    print("Invalid pet type.")
                    continue

                pet_dao.add_pet(pet)

            elif choice == '2':
                pets = pet_dao.get_all_pets()  # Call the correct method to get pets
                if pets:
                    print("\nAvailable Pets for Adoption:")
                    for pet in pets:
                        print(f"{pet['Name']} - {pet['Breed']} - Age: {pet['Age']} - Type: {pet['Type']}")
                else:
                    print("No pets available for adoption.")
            elif choice == '3':
                name = input("Enter donor name: ")
                amount = float(input("Enter donation amount ($): "))
                if amount < 10:
                    raise InsufficientFundsException()
                    donation = CashDonation(name, amount)
                    donation_dao.record_donation(donation)
            elif choice == '4':
                name = input("Enter donor name: ")
                item = input("Enter item type: ")
                donation = ItemDonation(name, item)  # Pass donor name and item type
                donation_dao.record_donation(donation)


            elif choice == '5':

                events = event_dao.get_all_events()

                if events:

                    for event in events:
                        print(f"Event: {event['Name']}, Date: {event['Date']}, Location: {event['Location']}")

                else:

                    print("No upcoming events.")



            elif choice == '6':

                name = input("Enter participant name: ")

                participant_type = input("Enter participant type (Adopter/Shelter): ")

                event_id = int(input("Enter Event ID to register: "))

                event_dao.register_participant(name, participant_type, event_id)


            elif choice == '0':
                print("Thank you for using PetPals!")
                break

            else:
                print("Invalid choice. Please try again.")

        except ValueError:
            print("Invalid input. Please enter valid data types.")
        except InvalidAgeException as e:
            print(f"Error: {e}")
        except NullReferenceException as e:
            print(f"Error: {e}")
        except InsufficientFundsException as e:
            print(f"Error: {e}")
        except AdoptionException as e:
            print(f"Error: {e}")
        except Exception as e:
            print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    main_menu()

