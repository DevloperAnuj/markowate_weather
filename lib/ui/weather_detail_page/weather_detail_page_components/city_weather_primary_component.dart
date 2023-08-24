import 'package:flutter/material.dart';
import '../../home_page/home_page_compnents/weather_desc_component.dart';
import '../../home_page/home_page_compnents/weather_temp_component.dart';
import 'city_weather_desc_component.dart';
import 'city_weather_temp_component.dart';

class CityWeatherPrimaryCardComponent extends StatelessWidget {

  final String temp;
  final String weatherDesc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: const Color(0xff004FEA),
        semanticContainer: true,
        elevation: 9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CityWeatherTempComponent(temp: temp),
            CityWeatherDescComponent(weatherDesc: weatherDesc),
          ],
        ),
      ),
    );
  }

  const CityWeatherPrimaryCardComponent({
    super.key,
    required this.temp,
    required this.weatherDesc,
  });
}

