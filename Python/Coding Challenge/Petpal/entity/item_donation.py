from datetime import datetime


class ItemDonation:
    def __init__(self, donor_name, item_type):
        self.donor_name = donor_name
        self.item_type = item_type
        self.donation_type = 'Item'
        self.donation_date = datetime.now()  # Assuming you want to set the donation date to the current time

    def get_donor_name(self):
        return self.donor_name

    def get_donation_type(self):
        return self.donation_type

    def get_item(self):
        return self.item_type

    def get_donation_date(self):
        return self.donation_date
