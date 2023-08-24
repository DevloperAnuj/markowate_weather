import 'package:flutter/material.dart';

class WeatherSecondaryWidget extends StatelessWidget {

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.water_drop_rounded,
                    color: Color(0xff004FEA),
                    size: 35,
                  ),
                  Text(
                    "$humidity"
                        "%",
                    style: const TextStyle(
                      color: Color(0xff004FEA),
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const Text(
                    "Humidity",
                    style: TextStyle(
                      color: Color(0xff004FEA),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.wind_power_outlined,
                    color: Color(0xff004FEA),
                    size: 35,
                  ),
                  Text(
                    "$windSpeed"
                        "m/s",
                    style: const TextStyle(
                      color: Color(0xff004FEA),
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const Text(
                    "Wind Speed",
                    style: TextStyle(
                      color: Color(0xff004FEA),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.cloud_circle,
                    color: Color(0xff004FEA),
                    size: 35,
                  ),
                  Text(
                    "$cloudy" "%",
                    style: const TextStyle(
                      color: Color(0xff004FEA),
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const Text(
                    "Cloudiness",
                    style: TextStyle(
                      color: Color(0xff004FEA),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  const WeatherSecondaryWidget({
    super.key,
    required this.humidity,
    required this.windSpeed,
    required this.cloudy,
  });
}