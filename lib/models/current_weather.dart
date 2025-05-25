//declare a class
class CurrentWeather {
  //do properties and make them _private
  late String _city;
  late String _description;
  late double _currentTemp;
  late DateTime _currentTime;
  late DateTime _sunrise;
  late DateTime _sunset;

  //do a generative constructor
  CurrentWeather({
    required String city,
    required String description,
    required double currentTemp,
    required DateTime currentTime,
    required DateTime sunrise,
    required DateTime sunset,
  }) {
    _city = city;
    _description = description;
    _currentTemp = currentTemp;
    _currentTime = currentTime;
    _sunrise = sunrise;
    _sunset = sunset;
  }

  //do getters and setters along with validation

  String get city {
    return _city;
  }

  //throws exception when value is empty
  set city(String value) {
    if (value.isEmpty) {
      throw Exception('City cannot be empty');
    }
    _city = value;
  }

  String get description {
    return _description;
  }

  //throws exception when value is empty
  set description(String value) {
    if (value.isEmpty) {
      throw Exception('Description cannot be empty');
    }
    _description = value;
  }

  double get currentTemp {
    return _currentTemp;
  }

  //throw exception if temperature is not bewteen -100 and 100
  set currentTemp(double value) {
    if (value < -100 || value > 100) {
      throw Exception('temperature must be between -100 and 100');
    }
    _currentTemp = value;
  }

  DateTime get currentTime {
    return _currentTime;
  }

  //setter for currentTime must ensure currentTime is not in the future
  set currentTime(DateTime newTime) {
    //get current date and time
    DateTime present = DateTime.now();

    //if day is after the current date and time throw exception
    if (newTime.isAfter(present)) {
      throw Exception('Current time cannot be in the future');
    }
    _currentTime = newTime;
  }

  DateTime get sunrise {
    return _sunrise;
  }

  set sunrise(DateTime value) {
    if (!_isSameDay(value, _currentTime)) {
      throw Exception('Sunrise must be on the same day as current time');
    }
    _sunrise = value;
  }

  DateTime get sunset {
    return _sunset;
  }

  set sunset(DateTime value) {
    if (!_isSameDay(value, _currentTime)) {
      throw Exception('Sunset must be on the same day as current time');
    }
    _sunset = value;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    if (a.year == b.year && a.month == b.month && a.day == b.day) {
      return true;
    } else {
      return false;
    }
  }


  //do a factory constructors
  factory CurrentWeather.fromOpenWeatherData(dynamic json) {
    return CurrentWeather(
      city: json['name'],
      description: json['weather'][0]['description'],
      currentTemp: json['main']['temp'],
      // Convert Unix timestamps (seconds) to DateTime
      currentTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000),
    );
  }

  @override
  String toString() {
    return 'City: $city, Description: $description, Current temperature: $currentTemp, Current Time $currentTime, Sunrise: $sunrise, Sunset: $sunset';
  }
  }



