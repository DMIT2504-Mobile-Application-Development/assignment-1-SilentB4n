
class CurrentWeather {
   late String _city;
    late String _description;
    late double _currentTemp;
    late DateTime _currentTime;
    late DateTime _sunrise;
    late DateTime _sunset;

    CurrentWeather({
    required String city, 
    required String description,
    required double currentTemp,
    required DateTime currentTime,
    required DateTime sunrise,
    required DateTime sunset,})
   {  _city = city;
      _description = description;
      _currentTemp = currentTemp;
      _currentTime = currentTime;
      _sunrise = sunrise;
      _sunset = sunset;
    }
}






