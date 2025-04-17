from entity.IAdoptable import IAdoptable

class AdoptionEvent:
    def __init__(self, event_name, location, date):
        self._event_name = event_name
        self._location = location
        self._date = date
        self._participants = []

    def host_event(self):
        print(f"Hosting event: {self._event_name} at {self._location} on {self._date}")
        for p in self._participants:
            p.adopt()

    def register_participant(self, participant: IAdoptable):
        self._participants.append(participant)
