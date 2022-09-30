import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
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
        String jsonResString = jsonEncode(jsonData).toString();
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString(platformTilePref, jsonResString);
      } else {
        if (!mounted) return;
        snackBarMessage(jsonData.toString(), context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void dataLoaded() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? storedPlatforms = pref.getString(platformTilePref);
    if (storedPlatforms != null) {
      setState(() {
        platforms = jsonDecode(storedPlatforms)["platforms"];
      });
    } else {
      getPlatforms();
    }
  }

  @override
  void initState() {
    super.initState();
    dataLoaded();
  }

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        AutoRouter.of(context).navigate(const HomeRoute());
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 76, 126, 78),
        endDrawer: const Sidebar(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(const HomeRoute());
              },
              child: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const PageTitle(title: 'BOOK A FACILITY'),
              SizedBox(height: (platforms != null) ? sH * 0.08 : sH * 0.35),
              (platforms != null)
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: sW * 0.08),
                      child: Column(children: [
                        PlatformTile(
                          image: const AssetImage('assets/images/pitch.jpg'),
                          platformID: platforms![2]["_id"].toString(),
                          platformName: platforms![2]["name"].toString(),
                          costPerHour: platforms![2]["costPerHour"].toString(),
                        ),
                        SizedBox(height: space),
                        PlatformTile(
                          image:
                              const AssetImage('assets/images/bball_court.jpg'),
                          platformName: platforms![1]["name"].toString(),
                          platformID: platforms![1]["_id"].toString(),
                          costPerHour: platforms![1]["costPerHour"].toString(),
                        ),
                        SizedBox(height: space),
                        PlatformTile(
                          image: const AssetImage(
                              'assets/images/tennis_court.jpg'),
                          platformID: platforms![0]["_id"].toString(),
                          platformName: platforms![0]["name"].toString(),
                          costPerHour: platforms![0]["costPerHour"].toString(),
                        ),
                      ]),
                    )
                  : const CircularProgressIndicator(),
            ],
          )),
        ),
      ),
    );
  }
}
