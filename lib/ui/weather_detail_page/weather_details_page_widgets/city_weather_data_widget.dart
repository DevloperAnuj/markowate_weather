import 'package:flutter/material.dart';

import '../weather_detail_page_components/city_date_component.dart';
import '../weather_detail_page_components/city_weather_placename_component.dart';
import '../weather_detail_page_components/city_weather_primary_component.dart';
import '../weather_detail_page_components/city_weather_secondary_component.dart';

class CityWeatherDataWidget extends StatelessWidget {

  final String cityName;
  final double temp;
  final String desc;
  final int humidity;
  final double windSpeed;
  final int cloudy;

  const CityWeatherDataWidget({
    super.key,
    required this.cityName,
    required this.temp,
    required this.desc,
    required this.humidity,
    required this.windSpeed,
    required this.cloudy,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CityWeatherPlaceNameComponent(
          cityName: cityName,
        ),
        const CityDateComponent(),
        CityWeatherPrimaryCardComponent(
          temp: temp.round().toString(),
          weatherDesc: desc,
        ),
        CityWeatherSecondaryComponent(
          cloudy: cloudy.toString(),
          humidity: humidity.toString(),
          windSpeed: windSpeed.toString(),
        ),
      ],
    );
  }
}
