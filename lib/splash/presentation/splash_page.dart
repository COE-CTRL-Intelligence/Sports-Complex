import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
          ),
        ),
      ),
    ));
  }
}
