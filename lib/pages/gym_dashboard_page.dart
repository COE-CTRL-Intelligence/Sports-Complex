import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../widgets/gym_side_bar.dart';

class GymDashboardPage extends StatefulWidget {
  const GymDashboardPage({Key? key}) : super(key: key);

  @override
  State<GymDashboardPage> createState() => _GymDashboardPageState();
}

Map<String, dynamic> userData = {};

class _GymDashboardPageState extends State<GymDashboardPage>
    with TickerProviderStateMixin {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  double height = 0;
  double weight = 0;
  double heightSqaure = 0;

  @override
  void initState() {
    // to do: implement initState
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
    pref.remove('jsonResString');
    if (!mounted) return;
    AutoRouter.of(context).navigate(const HomeRoute());
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  double calcBMI(double? height, double? weight) {
    double result = 0;
    if (height == null || weight == null || height == 0 || weight == 0) {
      result = 0.0;
    } else if (height >= 0 || weight >= 0) {
      result = height / weight;
    } else {
      result = 0.0;
    }
    setState(() {
      result = result;
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    TabController tabController = TabController(length: 2, vsync: this);
    return WillPopScope(
        onWillPop: () async {
          AutoRouter.of(context).navigate(const HomeRoute());
          return false;
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 216, 215, 215),
          endDrawer: const GymSideBar(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 1.0,
            title: const Text("GYM DASHBOARD"),
            titleSpacing: 0,
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TabBar(
                      controller: tabController,
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(left: 50, right: 100),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(text: "Profile"),
                        Tab(
                          text: "MyPlan",
                        )
                      ]),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: TabBarView(controller: tabController, children: [
                      profileTab(),
                      // SizedBox(height: 10),
                      planTab(),
                    ]),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: const Text('this page'))
                ],
              ),
            ),
          ),
        ));
  }

  Column profileTab() {
    return Column(children: [
      Container(
        height: 150,
        width: double.maxFinite,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 239, 239, 237),
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello ${userData["name"]},',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            const SizedBox(height: 20),
            // Text('Your Email: ${userData["email"]}'),
            Text(
              greeting(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      const SizedBox(height: 20),
      Container(
        height: 350,
        width: double.maxFinite,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 239, 239, 237),
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: heightController,
              style: const TextStyle(color: Colors.black),
            ),
            TextFormField(
              controller: weightController,
              style: const TextStyle(color: Colors.black),
            ),
            Text(calcBMI(double.tryParse(heightController.text),
                    double.tryParse(weightController.text))
                .toString()),
          ],
        ),
      ),
    ]);
  }

  Container planTab() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 239, 237),
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Monthly Bundle',
              style: TextStyle(fontSize: 18, fontWeight: (FontWeight.bold))),
          SizedBox(height: 4),
          Text(
            "Expires: 26/09/22",
          ),
          SizedBox(height: 4),
          Text("Paid with: Momo")
        ],
      ),
    );
  }
}
