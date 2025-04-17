from exception.InvalidAgeException import InvalidAgeException
from exception.NullReferenceException import NullReferenceException

class ValidationUtil:
    @staticmethod
    def validate_age(age):
        if age <= 0:
            raise InvalidAgeException()

    @staticmethod
    def validate_not_null(obj, field_name="Field"):
        if obj is None or (isinstance(obj, str) and obj.strip() == ""):
            raise NullReferenceException(f"{field_name} cannot be null or empty.")
