import 'package:flutter/material.dart';
import 'package:sports_complex/widgets/platform_tile.dart';
import 'package:sports_complex/widgets/side_bar.dart';

class SelectSportPage extends StatefulWidget {
  const SelectSportPage({Key? key}) : super(key: key);

  @override
  State<SelectSportPage> createState() => _SelectSportPageState();
}

class _SelectSportPageState extends State<SelectSportPage> {
  final double space = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 126, 78),
      endDrawer: const Sidebar(),
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
          const PlatformTile(
            image: AssetImage('assets/images/pitch.jpg'),
            platformName: 'Astro-Turf Pitch',
            costPerHour: '200.00',
          ),
          SizedBox(height: space),
          const PlatformTile(
            image: AssetImage('assets/images/bball_court.jpg'),
            platformName: 'Basketball Court',
            costPerHour: '200.00',
          ),
          SizedBox(height: space),
          const PlatformTile(
            image: AssetImage('assets/images/tennis_court.jpg'),
            platformName: 'Lawn Tennis Court',
            costPerHour: '200.00',
          ),
        ]),
      ),
    );
  }
}
