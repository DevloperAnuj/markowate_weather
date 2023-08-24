import 'package:flutter/material.dart';

class CityWeatherPlaceNameComponent extends StatelessWidget {

  final String cityName;

  const CityWeatherPlaceNameComponent({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "📍 $cityName",
        style: const TextStyle(
          color: Colors.indigo,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}