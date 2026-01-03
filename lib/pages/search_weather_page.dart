import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/widgets/display_weather.dart';

class SearchWeatherPage extends StatefulWidget {
  const SearchWeatherPage({super.key});

  @override
  State<SearchWeatherPage> createState() => _SearchWeatherPageState();
}

class _SearchWeatherPageState extends State<SearchWeatherPage> {
  final WeatherService _weatherService = WeatherService(
    apiKey: dotenv.env["OPEN_WEATHER_API_KEY"] ?? "",
  );

  Weather? _weather;
  String? _error;

  final TextEditingController _controller = TextEditingController();

  // city ekak enter karalnawa
  void _searchWeather() async {
    final city = _controller.text.trim();

    //enter karapu eka empty nam
    if (city.isEmpty) {
      setState(() {
        _error = "Please enter a city name";
      });
      return;
    }

    //empty na nam weather ekak gannawa

    try {
      final weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
        _error = null;
      });
    } catch (error) {
      //api eke nathi ekk enter krl nam
      setState(() {
        _error = "Could not find weather for $city";
      });
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Weather")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'City Name',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchWeather,
                  ),
                ),
                onSubmitted: (value) => _searchWeather(),
              ),
              const SizedBox(height: 15),
              //mokakma hari error ekak thiyenw nam
              _error != null
                  ? Text(_error!, style: const TextStyle(color: Colors.red))
                  //weather ekk thiyenw nam
                  : _weather != null
                  ? WeatherDisplay(weather: _weather!)
                  // weather eka null nm
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
