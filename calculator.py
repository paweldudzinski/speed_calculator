import datetime


class SpeedCalculator(object):
    """Calculates speed and pace for given time and distance.
       :distance: in meters
       :time_tuple: as (hours, minutes, seconds) tuple
    """

    def __init__(self, distance, time_tuple):
        self.distance = distance
        self.time = time_tuple

    def _get_total_seconds(self):
        hours, minutes, seconds = self.time
        return hours * 3600.0 + minutes * 60.0 + seconds

    def _get_distance_in_km(self):
        return self.distance / 1000.0

    def _get_distance_in_m(self, meters):
        return self.distance / float(meters)

    def pace(self):
        """Pace returns timedelta for (seconds)/km"""
        kilometers = self._get_distance_in_km()
        total_seconds = self._get_total_seconds()
        average_pace = total_seconds/kilometers
        return datetime.timedelta(seconds=average_pace)

    def querter_km_pace(self):
        quarters = self._get_distance_in_m(250)
        total_seconds = self._get_total_seconds()
        average_pace = total_seconds/quarters
        return datetime.timedelta(seconds=average_pace)

    def hundred_m_pace(self):
        quarters = self._get_distance_in_m(100)
        total_seconds = self._get_total_seconds()
        average_pace = total_seconds/quarters
        return datetime.timedelta(seconds=average_pace)

    def fifty_m_pace(self):
        quarters = self._get_distance_in_m(50)
        total_seconds = self._get_total_seconds()
        average_pace = total_seconds/quarters
        return datetime.timedelta(seconds=average_pace)

    def ten_k_pace(self):
        quarters = self._get_distance_in_m(10000)
        total_seconds = self._get_total_seconds()
        average_pace = total_seconds/quarters
        return datetime.timedelta(seconds=average_pace)

    def five_k_pace(self):
        quarters = self._get_distance_in_m(5000)
        total_seconds = self._get_total_seconds()
        average_pace = total_seconds/quarters
        return datetime.timedelta(seconds=average_pace)

    def speed(self):
        """Speed returns float for km/h"""
        kilometers = self._get_distance_in_km()
        total_seconds = self._get_total_seconds()
        percentage_of_hour = total_seconds / 3600.0
        return kilometers / percentage_of_hour

