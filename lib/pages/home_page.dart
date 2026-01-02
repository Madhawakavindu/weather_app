import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/search_weather_page.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/widgets/display_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherService _weatherService = WeatherService(
    apiKey: dotenv.env["OPEN_WEATHER_API_KEY"] ?? "",
  );

  Weather? _weather;

  // method to fetch the weather
  void fetchWeather() async {
    try {
      final weather = await _weatherService.getWeatherFromLocation();

      setState(() {
        _weather = weather;
      });
    } catch (error) {
      print("Error from weather data: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Easy Weather",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.light_mode))],
      ),
      body: _weather != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeatherDisplay(weather: _weather!),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchWeatherPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Search Weather",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
