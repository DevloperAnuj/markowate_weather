import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatelessWidget {

  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff6CA2FC),
            Color(0xff004fea),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/anims/weat.json"),
            const SizedBox(height: 50,),
            const Text(
              "Markowate",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 40,
              ),
            ),
            const Text(
              "Weather",
              style: TextStyle(
                color: Colors.yellowAccent,
                fontWeight: FontWeight.w100,
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
