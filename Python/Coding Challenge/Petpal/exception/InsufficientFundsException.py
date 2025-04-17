class InsufficientFundsException(Exception):
    def __init__(self, message="Insufficient funds for donation."):
        super().__init__(message)
