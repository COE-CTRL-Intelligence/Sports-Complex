import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sports_complex/pages/routes/app_router.gr.dart';

class GymDashboardPage extends StatefulWidget {
  // final Map<String, dynamic> user;
  const GymDashboardPage({super.key});

  @override
  State<GymDashboardPage> createState() => _GymDashboardPageState();
}

class _GymDashboardPageState extends State<GymDashboardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('login');
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
        debugPrint('Back Button Pressed');
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
                const Icon(
                  Icons.man,
                  size: 50,
                ),
                // Text('Hello ${widget.user["name"]}'),
                // const SizedBox(height: 15),
                // Text('Your Email: ${widget.user["email"]}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
