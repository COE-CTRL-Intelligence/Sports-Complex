import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';

class GymDashboardPage extends StatefulWidget {
  const GymDashboardPage({super.key});

  @override
  State<GymDashboardPage> createState() => _GymDashboardPageState();
}

class _GymDashboardPageState extends State<GymDashboardPage> {
  // Variables
  Map<String, dynamic> userData = {};

  // Methods
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  void getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString('jsonResString');
    if (val != null) {
      setState(() {
        userData = json.decode(val);
      });
    }
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    if (!mounted) return;
    AutoRouter.of(context).navigate(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AutoRouter.of(context).navigate(const HomeRoute());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Gym Dashboard'),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () => logout(),
                  ))
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userData['gender'] == 'M'
                    ? const Icon(
                        Icons.man,
                        color: Colors.blue,
                        size: 100,
                      )
                    : const Icon(
                        Icons.woman,
                        size: 100,
                        color: Colors.pink,
                      ),
                Text('Hello ${userData["name"]}'),
                const SizedBox(height: 15),
                Text('Your Email: ${userData["email"]}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
