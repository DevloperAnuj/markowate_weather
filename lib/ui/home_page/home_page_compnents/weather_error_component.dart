import 'package:flutter/material.dart';

class WeatherErrorComponent extends StatelessWidget {
  const WeatherErrorComponent({
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