import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sports_complex/utils/constants.dart';
import 'package:sports_complex/utils/snackbar_msg.dart';
import 'package:sports_complex/widgets/page_title.dart';
import 'package:sports_complex/widgets/platform_tile.dart';
import 'package:sports_complex/widgets/side_bar.dart';
import 'package:http/http.dart' as http;

class SelectSportPage extends StatefulWidget {
  const SelectSportPage({Key? key}) : super(key: key);

  @override
  State<SelectSportPage> createState() => _SelectSportPageState();
}

class _SelectSportPageState extends State<SelectSportPage> {
  // Variables
  final double space = 30;
  List<dynamic>? platforms;

  // Methods
  void getPlatforms() async {
    try {
      var response = await http.get(Uri.parse('$baseURL/platforms'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200 && mounted) {
        setState(() {
          platforms = jsonData['platforms'];
        });
      } else {
        if (!mounted) return;
        snackBarMessage(jsonData.toString(), context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getPlatforms();
  }

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 126, 78),
      endDrawer: const Sidebar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const PageTitle(title: 'BOOK A FACILITY'),
            SizedBox(height: (platforms != null) ? sH * 0.08 : sH * 0.4),
            (platforms != null)
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: sW * 0.08),
                    child: Column(children: [
                      PlatformTile(
                        image: const AssetImage('assets/images/pitch.jpg'),
                        platformName: platforms![2]["name"].toString(),
                        costPerHour: platforms![2]["costPerHour"].toString(),
                      ),
                      SizedBox(height: space),
                      PlatformTile(
                        image:
                            const AssetImage('assets/images/bball_court.jpg'),
                        platformName: platforms![1]["name"].toString(),
                        costPerHour: platforms![1]["costPerHour"].toString(),
                      ),
                      SizedBox(height: space),
                      PlatformTile(
                        image:
                            const AssetImage('assets/images/tennis_court.jpg'),
                        platformName: platforms![0]["name"].toString(),
                        costPerHour: platforms![0]["costPerHour"].toString(),
                      ),
                    ]),
                  )
                : const CircularProgressIndicator(),
          ],
        )),
      ),
    );
  }
}
