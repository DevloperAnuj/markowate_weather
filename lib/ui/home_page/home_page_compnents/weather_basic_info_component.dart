import 'package:flutter/material.dart';

class WeatherBasicInfoComponent extends StatelessWidget {

  const WeatherBasicInfoComponent({
    super.key,
    required this.value,
    required this.infoName,
    required this.iconData,
  });

  final String value;
  final String infoName;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            iconData,
            color: const Color(0xff004FEA),
            size: 35,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xff004FEA),
              fontSize: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
          Text(
            infoName,
            style: const TextStyle(
              color: Color(0xff004FEA),
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}