class AdoptionException(Exception):
    def __init__(self, message="Adoption could not be completed."):
        super().__init__(message)
