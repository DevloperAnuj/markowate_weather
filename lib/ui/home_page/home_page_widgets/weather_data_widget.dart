import 'package:flutter/material.dart';
import '../home_page_compnents/date_component.dart';
import '../home_page_compnents/weather_placename_component.dart';
import '../home_page_compnents/weather_primary_component.dart';
import '../home_page_compnents/weather_secondary_component.dart';

class WeatherDataWidget extends StatelessWidget {
  final double lat;
  final double lon;
  final String cityName;
  final double temp;
  final String desc;
  final int humidity;
  final double windSpeed;
  final int cloudy;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        WeatherPlaceNameComponent(
          cityName: cityName,
          lat: lat,
          lon: lon,
        ),
        const DateComponent(),
        WeatherPrimaryCardComponent(
          temp: temp.round().toString(),
          weatherDesc: desc,
        ),
        WeatherSecondaryComponent(
          cloudy: cloudy.toString(),
          humidity: humidity.toString(),
          windSpeed: windSpeed.toString(),
        ),
      ],
    );
  }

  const WeatherDataWidget({
    super.key,
    required this.lat,
    required this.lon,
    required this.cityName,
    required this.temp,
    required this.desc,
    required this.humidity,
    required this.windSpeed,
    required this.cloudy,
  });
}