import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;
  const WeatherDisplay({
    super.key, 
    required this.weather,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
        ],
      ),
    ),);
  }
}
