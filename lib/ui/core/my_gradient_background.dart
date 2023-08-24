import 'package:flutter/material.dart';

class MyGradientBackGround extends StatelessWidget {
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffF5F5F5),
            Color(0xff004FEA),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }

  const MyGradientBackGround({
    super.key,
    required this.child,
  });
}