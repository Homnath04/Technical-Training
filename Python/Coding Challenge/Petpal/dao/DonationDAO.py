from dao.DBConnection import DBConnection
from entity.cash_donation import CashDonation
from entity.item_donation import ItemDonation

class DonationDAO:
    @staticmethod
    def record_cash_donation(donation):
        try:
            # Extract attributes from the donation object (this applies to both cash and item donations)
            donor_name = donation.get_donor_name()
            donation_type = donation.get_donation_type()
            amount = donation.get_amount() if isinstance(donation, CashDonation) else None
            item = donation.get_item() if isinstance(donation, ItemDonation) else None
            donation_date = donation.get_donation_date()

            # Use database connection to record donation (Cash or Item)
            conn = DBConnection.get_connection()
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO Donations (DonorName, DonationType, DonationAmount, DonationItem, DonationDate) VALUES (?, ?, ?, ?, ?)",
                (donor_name, donation_type, amount, item, donation_date)
            )
            conn.commit()
            cursor.close()
            conn.close()
            print("Donation recorded successfully.")
        except Exception as e:
            print("Error recording donation:", e)

    @staticmethod
    def record_donation(donation):
        try:
            conn = DBConnection.get_connection()
            cursor = conn.cursor()

            # Check donation type and insert accordingly
            if isinstance(donation, CashDonation):
                cursor.execute(
                    "INSERT INTO Donations (DonorName, DonationType, DonationAmount, DonationDate) VALUES (?, ?, ?, ?)",
                    (donation.get_donor_name(), donation.get_donation_type(), donation.amount,
                     donation.get_donation_date())
                )
            elif isinstance(donation, ItemDonation):
                cursor.execute(
                    "INSERT INTO Donations (DonorName, DonationType, DonationItem, DonationDate) VALUES (?, ?, ?, ?)",
                    (donation.get_donor_name(), donation.get_donation_type(), donation.get_item(),
                     donation.get_donation_date())
                )
            conn.commit()
            cursor.close()
            conn.close()
            print(f"{donation.get_donation_type()} donation recorded.")
        except Exception as e:
            print("Error recording donation:", e)