import 'package:flutter/material.dart';

class CityWeatherErrorComponent extends StatelessWidget {
  const CityWeatherErrorComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error,
        size: 100,
        color: Colors.red,
      ),
    );
  }
}