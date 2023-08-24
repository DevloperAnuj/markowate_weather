import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CityWeatherDescComponent extends StatelessWidget {
  const CityWeatherDescComponent({
    super.key,
    required this.weatherDesc,
  });

  final String weatherDesc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Lottie.asset(
            "assets/anims/weat.json",
            fit: BoxFit.cover,
            width: 150,
          ),
          Expanded(
            child: Text(
              weatherDesc,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}