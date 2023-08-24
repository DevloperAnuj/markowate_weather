import 'package:flutter/material.dart';
import 'city_basic_info_component.dart';

class CityWeatherSecondaryComponent extends StatelessWidget {
  final String humidity;
  final String windSpeed;
  final String cloudy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: Colors.white,
        semanticContainer: true,
        elevation: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CityBasicInfoComponent(
              iconData: Icons.water_drop_rounded,
              value: "$humidity" "%",
              infoName: "Humidity",
            ),
            CityBasicInfoComponent(
              iconData: Icons.wind_power_outlined,
              value: "$windSpeed " "mtr/s",
              infoName: "Wind Speed",
            ),
            CityBasicInfoComponent(
              iconData: Icons.cloud_circle_rounded,
              value: "$cloudy" "%",
              infoName: "Cloudiness",
            ),
          ],
        ),
      ),
    );
  }

  const CityWeatherSecondaryComponent({
    super.key,
    required this.humidity,
    required this.windSpeed,
    required this.cloudy,
  });
}




