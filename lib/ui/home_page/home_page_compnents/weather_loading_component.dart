import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherLoadingComponent extends StatelessWidget {
  const WeatherLoadingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/anims/winder.json"),
          const Text(
            "Fetching Weather...",
            style: TextStyle(
                fontSize: 30,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}