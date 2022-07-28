// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'splashscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
