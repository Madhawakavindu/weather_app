import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/get_location_service.dart';

class WeatherService {
  //https://api.openweathermap.org/data/2.5/weather?q=London
  //&appid=2c2121ad665866dc922fa150219467db&units=metric
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';

  final String apiKey;

  WeatherService({required this.apiKey});

  //get the weather from the city name
  Future<Weather> getWeather(String cityName) async {
    try {
      final url = '$BASE_URL?q=$cityName&appid=$apiKey&units=metric';

      final Response = await http.get(Uri.parse(url));

      if (Response.statusCode == 200) {
        final json = jsonDecode(Response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception("Faild to load the weather data");
      }
    } catch (error) {
      throw Exception("Faild to load the weather data");
    }
  }

  // get the weather from the current location
  Future<Weather> getWeatherFromLocation() async {
    try {
      final location = GetLocationService();
      final cityName = await location.getCityNameFromCurrentLocation();

      final url = '$BASE_URL?q=$cityName&appid=$apiKey&units=metric';

      final Response = await http.get(Uri.parse(url));

      if (Response.statusCode == 200) {
        final json = jsonDecode(Response.body);
        return Weather.fromJson(json);
      } else {
        throw Exception("Faild to load the weather data");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Faild to load the weather data");
    }
  }
}
