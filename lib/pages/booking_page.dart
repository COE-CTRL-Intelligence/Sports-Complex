import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'hi, this the BOOKING PAGE',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}