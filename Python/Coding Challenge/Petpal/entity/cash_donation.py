from entity.donation import Donation
from datetime import datetime

class CashDonation(Donation):
    def __init__(self, donor_name, amount, donation_date=None):
        super().__init__(donor_name, amount)
        self._donation_date = donation_date if donation_date else datetime.now()

    def record_donation(self):
        return f"Cash donation of ${self._amount} by {self._donor_name} on {self._donation_date.strftime('%Y-%m-%d')}."
