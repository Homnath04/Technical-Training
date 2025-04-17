from dao.DBConnection import DBConnection

class ShelterDAO:
    @staticmethod
    def get_all_shelters():
        shelters = []
        try:
            conn = DBConnection.get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Shelters")
            for row in cursor.fetchall():
                shelters.append({"ShelterID": row.ShelterID, "Name": row.Name, "Location": row.Location})
            cursor.close()
            conn.close()
        except Exception as e:
            print("Error fetching shelters:", e)
        return shelters
