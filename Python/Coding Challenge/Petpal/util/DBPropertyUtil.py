class DBPropertyUtil:
    @staticmethod
    def get_connection_string(filename):
        try:
            with open(filename, 'r') as file:
                properties = {}
                for line in file:
                    if "=" in line:
                        key, value = line.strip().split('=', 1)
                        properties[key.strip()] = value.strip()
                return properties.get("connection_string")
        except FileNotFoundError:
            raise Exception("Properties file not found.")
        except Exception as e:
            raise Exception(f"Error reading property file: {e}")
