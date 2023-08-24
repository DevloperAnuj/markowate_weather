import 'package:flutter/material.dart';

class WeatherTempComponent extends StatelessWidget {

  const WeatherTempComponent({
    super.key,
    required this.temp,
  });

  final String temp;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$temp"
          "\u2103",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 85,
        fontWeight: FontWeight.w100,
      ),
    );
  }
}