import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/utils/colors.dart';
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

  @override
  void initState() {
    // to do: implement initState
    super.initState();
    getUserData();
  }

  void getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString('gymPassPref');
    if (val != null) {
      setState(() {
        userData = json.decode(val);
      });
    }
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('gymPassPref');
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
      result = weight / (height * height);
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
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Column(children: [
      Container(
        height: sH * 0.22,
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
      SizedBox(height: sH * 0.05),
      Container(
        height: sH * 0.4,
        width: double.maxFinite,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 239, 239, 237),
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Calculate Your BMI",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: sH * 0.025),
            ),
            TextFormField(
              controller: heightController,
              style: TextStyle(color: Colors.black, height: sH * 0.0005),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(style: BorderStyle.solid)),
                  hintText: "Enter Height",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: sH * 0.02,
                      color: AppColor.grey1)),
              cursorHeight: sH * 0.030,
              cursorColor: Colors.black,
            ),
            TextFormField(
              controller: weightController,
              style: TextStyle(color: Colors.black, height: sH * 0.0005),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(style: BorderStyle.solid)),
                  hintText: "Enter Weight",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: sH * 0.02,
                      color: AppColor.grey1)),
              cursorHeight: sH * 0.030,
              cursorColor: Colors.black,
            ),
            Text(calcBMI(double.tryParse(heightController.text),
                    double.tryParse(weightController.text))
                .toString()),
          ],
        ),
      ),
      SizedBox(height: sH * 0.05),
      ElevatedButton(
          onPressed: () => calcBMI(double.tryParse(heightController.text),
                  double.tryParse(weightController.text))
              .toString(),
          child: Text(
            "Calculate BMI",
            style: TextStyle(fontSize: sH * 0.025),
          )),
    ]);
  }

  Column planTab() {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: sH * 0.22,
          width: double.maxFinite,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 239, 237),
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Monthly Bundle',
                  style:
                      TextStyle(fontSize: 18, fontWeight: (FontWeight.bold))),
              SizedBox(height: 4),
              Text(
                "Expires: 26/09/22",
              ),
              SizedBox(height: 4),
              Text("Paid with: Momo")
            ],
          ),
        ),
        SizedBox(height: sH * 0.05),
        Text(
          "Build Your Plan",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: sH * 0.04),
        ),
        SizedBox(height: sH * 0.03),
        Text("Subscribe",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: sH * 0.025)),
        SizedBox(height: sH * 0.05),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
            child: Column(
              children: [
                SizedBox(
                  height: sH * 0.007,
                ),
                SizedBox(
                  height: sH * 0.1,
                  width: double.infinity,
                  child: const Text(
                    "Auto-renews Monthly, cancel anytime",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
