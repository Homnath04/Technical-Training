class NullReferenceException(Exception):
    def __init__(self, message="A required reference was found to be null or missing."):
        super().__init__(message)
