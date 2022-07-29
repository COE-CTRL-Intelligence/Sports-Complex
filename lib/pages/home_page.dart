import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            "Welcome to HomePage.",
            style: TextStyle(
              fontSize: 35,
            ),
          ),
        ),
      ),
    );
  }
}
