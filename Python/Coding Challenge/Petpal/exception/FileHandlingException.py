class FileHandlingException(Exception):
    def __init__(self, message="Error reading the file."):
        super().__init__(message)
