import 'package:flutter/material.dart';
import 'src/splashscreen.dart';
import 'src/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Sportify',
      // Start the app with the "/" named route. In this case, the app starts
      // on the SplashScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the SplashScreen widget.
        '/': (context) => const SplashScreen(),
        // When navigating to the "/home" route, build the homescreen widget.
        '/home': (context) => const HomeScreen(),
      },
    ),
  );
}
