from dao.DBConnection import DBConnection

class AdoptionEventDAO:
    @staticmethod
    def create_event(name, date, location):
        try:
            conn = DBConnection.get_connection()
            cursor = conn.cursor()
            cursor.execute(
                "INSERT INTO AdoptionEvents (EventName, EventDate, Location) VALUES (?, ?, ?)",
                (name, date, location)
            )
            conn.commit()
            cursor.close()
            conn.close()
            print("Adoption event created.")
        except Exception as e:
            print("Error creating event:", e)

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
            print(f"{participant_type} '{name}' successfully registered for event {event_id}.")
        except Exception as e:
            print("Error registering participant:", e)

    @staticmethod
    def get_all_events():
        events = []
        try:
            conn = DBConnection.get_connection()
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM AdoptionEvents")
            for row in cursor.fetchall():
                events.append({
                    "EventID": row.EventID,
                    "Name": row.EventName,
                    "Date": row.EventDate,
                    "Location": row.Location
                })
            cursor.close()
            conn.close()
        except Exception as e:
            print("Error fetching events:", e)
        return events
