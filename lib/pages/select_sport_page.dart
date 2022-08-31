import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/booking_page.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';

class SelectSportPage extends StatelessWidget {
  const SelectSportPage({Key? key}) : super(key: key);

  final double space = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 126, 78),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            height: 35,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: const Center(
              child: Text('BOOK A FACILITY',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),
          SizedBox(height: space),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.only(left: 0, right: 0)),
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              elevation: MaterialStateProperty.all(0),
            ),
            onPressed: () {
              AutoRouter.of(context).push(const BookingRoute());
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/images/pitch.jpg',
                  fit: BoxFit.fill,
                  width: 300,
                  height: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 20,
                  child: Text(
                    'Astro-Turf Pitch GHc 200.00/hour',
                    style: TextStyle(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: space),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.only(left: 0, right: 0)),
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              elevation: MaterialStateProperty.all(0),
            ),
            onPressed: () {
              AutoRouter.of(context).push(const BookingRoute());
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/images/bball_court.jpg',
                  fit: BoxFit.fill,
                  width: 300,
                  height: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 20,
                  child: Text(
                    'Basketball Court GHc 200.00/hour',
                    style: TextStyle(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: space),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  const EdgeInsets.only(left: 0, right: 0)),
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              elevation: MaterialStateProperty.all(0),
            ),
            onPressed: () {
              AutoRouter.of(context).push(const BookingRoute());
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/images/tennis_court.jpg',
                  fit: BoxFit.fill,
                  width: 300,
                  height: 120,
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 20,
                  child: Text(
                    'Lawn Tennis Court GHc 200.00/hour',
                    style: TextStyle(fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
