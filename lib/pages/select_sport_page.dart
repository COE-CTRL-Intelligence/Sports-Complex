import 'package:flutter/material.dart';
import 'package:sports_complex/widgets/page_title.dart';
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
          const PageTitle(title: 'BOOK A FACILITY'),
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
