import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CityWeatherLoadingComponent extends StatelessWidget {
  const CityWeatherLoadingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/anims/loc_blue.json"),
          const Text(
            "Fetching Weather...",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
