import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/utils/colors.dart';
import 'package:sports_complex/utils/constants.dart';
import 'dart:convert';
import '../widgets/gym_side_bar.dart';

class GymDashboardPage extends StatefulWidget {
  const GymDashboardPage({Key? key}) : super(key: key);

  @override
  State<GymDashboardPage> createState() => _GymDashboardPageState();
}

Map<String, dynamic> userData = {};
int tabIndex = 0;

class _GymDashboardPageState extends State<GymDashboardPage>
    with TickerProviderStateMixin {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  void getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString(gymUserPref);
    if (val != null) {
      setState(() {
        userData = json.decode(val);
      });
    }
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(gymUserPref);
    if (!mounted) return;
    AutoRouter.of(context).navigate(const HomeRoute());
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning.';
    }
    if (hour < 17) {
      return 'Good Afternoon.';
    }
    return 'Good Evening.';
  }

  double calcBMI(double? height, double? weight) {
    double result = 0;
    if (height == null || weight == null || height == 0 || weight == 0) {
      result = 0.0;
    } else if (height >= 0 || weight >= 0) {
      result = weight / (pow(height, 2));
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

    TabController tabController =
        TabController(length: 2, vsync: this, initialIndex: tabIndex);
    return WillPopScope(
        onWillPop: () async {
          AutoRouter.of(context).navigate(const HomeRoute());
          return false;
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 216, 215, 215),
          endDrawer: GymSideBar(logout: logout),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 1.0,
            title: const Text("GYM DASHBOARD"),
            titleSpacing: 0,
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: Column(
                  children: [
                    TabBar(
                        controller: tabController,
                        isScrollable: false,
                        labelPadding:
                            const EdgeInsets.only(left: 50, right: 100),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black,
                        tabs: const [
                          Tab(text: "MyPlan"),
                          Tab(
                            text: "Profile",
                          )
                        ]),
                    SizedBox(height: sH * 0.03),
                    SizedBox(
                      // margin: EdgeInsets.only(right: sW * 0.1),
                      // padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.maxFinite,
                      height: sH * 0.8,
                      child: TabBarView(controller: tabController, children: [
                        planTab(),
                        // SizedBox(height: 10),
                        profileTab(),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

//PROFILE TAB
  Container profileTab() {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Container(
          height: sH * 0.12,
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
        SizedBox(height: sH * 0.03),
        Container(
          height: sH * 0.3,
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
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: sH * 0.025),
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
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(style: BorderStyle.solid)),
                    hintText: "Enter Weight",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: sH * 0.02,
                        color: AppColor.grey1)),
                cursorHeight: sH * 0.030,
                cursorColor: Colors.black,
              ),
              Text(
                calcBMI(double.tryParse(heightController.text),
                        double.tryParse(weightController.text))
                    .toStringAsFixed(2),
              ),
            ],
          ),
        ),
        SizedBox(height: sH * 0.03),
        ElevatedButton(
            onPressed: () {
              calcBMI(double.tryParse(heightController.text),
                      double.tryParse(weightController.text))
                  .toStringAsFixed(2);
            },
            child: Text(
              "Calculate BMI",
              style: TextStyle(fontSize: sH * 0.025),
            )),
      ]),
    );
  }

//PLAN TAB
  Container planTab() {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            height: sH * 0.15,
            width: sW * double.maxFinite,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 239, 237),
                borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello ${userData["name"]},',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: AppColor.green2),
                ),
                const SizedBox(height: 20),
                // Text('Your Email: ${userData["email"]}'),
                Text(
                  greeting(),
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(height: sH * 0.03),
          Text(
            "Build Your Plan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: sH * 0.03),
          ),
          SizedBox(height: sH * 0.02),
          // Text("Subscribe",
          //     style:
          // TextStyle(fontWeight: FontWeight.bold, fontSize: sH * 0.025)),

          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  elevation: MaterialStateProperty.all(10),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: Column(
                children: [
                  SizedBox(
                    height: sH * 0.007,
                  ),
                  Container(
                    height: sH * 0.11,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: sH * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Monthly",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          "GH₵120.00",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 0.1,
                        ),
                        Text(
                          "Auto-renews , cancel anytime",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              )),
          SizedBox(
            height: sH * 0.015,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  elevation: MaterialStateProperty.all(10),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: Column(
                children: [
                  SizedBox(
                    height: sH * 0.007,
                  ),
                  Container(
                    height: sH * 0.11,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: sH * 0.02),
                    // decoration: boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),spreadRadius:5,blurRadius:7,offset:Offset(0,3))],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "3-Months",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          "GH₵360.00",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14),
                        ),
                        Text(
                          "Auto-renews Monthly, cancel anytime",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: sH * 0.015,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  elevation: MaterialStateProperty.all(10),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: Column(
                children: [
                  SizedBox(
                    height: sH * 0.007,
                  ),
                  Container(
                    height: sH * 0.11,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: sH * 0.02),
                    // decoration: boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),spreadRadius:5,blurRadius:7,offset:Offset(0,3))],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "6-Months",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          "GH₵720.00",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          "Auto-renews Monthly, cancel anytime",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              )),
          SizedBox(height: sH * 0.015),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  elevation: MaterialStateProperty.all(10),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)))),
              child: Column(
                children: [
                  SizedBox(
                    height: sH * 0.007,
                  ),
                  Container(
                    height: sH * 0.11,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: sH * 0.02),
                    // decoration: boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),spreadRadius:5,blurRadius:7,offset:Offset(0,3))],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Yearly",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text(
                          "GH₵1,440.00",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Text(
                          "Auto-renews Monthly, cancel anytime",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
