import 'package:flutter/material.dart';

class CityWeatherInitialComponent extends StatelessWidget {
  const CityWeatherInitialComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.search_rounded,
              size: 150,
              color: Colors.indigoAccent,
            ),
            Text(
              "Get Weather by City Name !",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}