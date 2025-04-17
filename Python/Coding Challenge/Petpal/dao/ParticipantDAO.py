from dao.DBConnection import DBConnection

class ParticipantDAO:
    @staticmethod
    def register_participant(name, participant_type, event_id):
        try:
            conn = DBConnection.get_connection()
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO Participants (ParticipantName, ParticipantType, EventID) VALUES (?, ?, ?)",
                (name, participant_type, event_id)
            )
            conn.commit()
            cursor.close()
            conn.close()
            print("Participant registered.")
        except Exception as e:
            print("Error registering participant:", e)
