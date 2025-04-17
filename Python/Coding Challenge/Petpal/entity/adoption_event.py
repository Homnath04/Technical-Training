class AdoptionEvent:
    def __init__(self, event_name, event_date, location):
        self.event_name = event_name
        self.event_date = event_date
        self.location = location
        self.participants = []

    def register_participant(self, participant):
        self.participants.append(participant)
        print(f"{participant} registered for {self.event_name}")

    def host_event(self):
        print(f"Hosting {self.event_name} on {self.event_date} at {self.location}")
        print("Participants:")
        for p in self.participants:
            print(f"- {p}")
