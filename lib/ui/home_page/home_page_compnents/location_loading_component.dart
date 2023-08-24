import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LocationLoadingComponent extends StatelessWidget {
  const LocationLoadingComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/anims/locfec.json"),
          const Text(
            "Wait...Fetching Your Location !",
            style: TextStyle(
                fontSize: 30,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}