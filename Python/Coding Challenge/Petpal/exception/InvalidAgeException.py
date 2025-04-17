class InvalidAgeException(Exception):
    def __init__(self, message="Age must be a positive number."):
        super().__init__(message)
