import 'package:flutter/material.dart';

class GymPage extends StatelessWidget {
  const GymPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "hi, this the GYM PAGE, GOOD LUCK",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
