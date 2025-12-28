import 'package:weather/models/weather_model.dart';

class WeatherService {
  //https://api.openweathermap.org/data/2.5/weather?q=London
  //&appid=2c2121ad665866dc922fa150219467dbunits=metric
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';

  final String apiKey;

  WeatherService({required this.apiKey});

  //get the weather from the city name
  Future<Weather> getWeather(String cityName) async {}
}
