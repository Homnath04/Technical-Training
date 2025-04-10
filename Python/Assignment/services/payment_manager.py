class PaymentManager:
    def __init__(self):
        self.payments = []

    def record_payment(self, payment):
        self.payments.append(payment)

    def update_payment_status(self, payment_id, new_status):
        for p in self.payments:
            if p.payment_id == payment_id:
                p.status = new_status
                return
        raise Exception("Payment not found.")
