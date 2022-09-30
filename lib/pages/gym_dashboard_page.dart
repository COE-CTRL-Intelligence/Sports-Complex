import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/utils/colors.dart';
import 'package:sports_complex/utils/constants.dart';
import 'package:sports_complex/widgets/custom_input_field.dart';
import 'dart:convert';
import '../widgets/gym_side_bar.dart';

class GymDashboardPage extends StatefulWidget {
  const GymDashboardPage({Key? key}) : super(key: key);

  @override
  State<GymDashboardPage> createState() => _GymDashboardPageState();
}

//---------------------------------------------------------------------variables
Map<String, dynamic> userData = {};
int tabIndex = 0;
String res = "";

class _GymDashboardPageState extends State<GymDashboardPage>
    with TickerProviderStateMixin {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

//-----------------------------------------------------------------------methods
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

  void calcBMI(double? height, double? weight) {
    double result = 0;
    if (height == null || weight == null || height == 0 || weight == 0) {
      result = 0.0;
    } else if (height >= 0 || weight >= 0) {
      result = weight / (height * height);
    } else {
      result = 0.0;
    }
    String resultt = "";
    setState(() {
      resultt = result.toStringAsFixed(2);
    });

    if (result < 18.5 && result > 0) {
      res =
          "Your BMI is$resultt. You should be attending a restaurant instead ...";
    } else if (result > 18.4 && result < 30.0) {
      res = "Your BMI is $resultt. Wow you look good, can I get your number?";
    } else if (result > 24.9 && result < 30.0) {
      res = "Your BMI is $resultt. You're fat, you should be here often";
    } else if (result > 29.9) {
      res =
          "Your BMI is hmm....I can't say, but you're what they call OLUFTUBUM";
    } else {
      res = "Invalid BMI Value";
    }
  }

  //----------------------------------------------------gymDashboardPage starts
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
                      width: double.maxFinite,
                      height: sH * 0.8,
                      child: TabBarView(controller: tabController, children: [
                        planTab(),
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

//-------------------------------------------------------------------PROFILE TAB
  Container profileTab() {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Container(
          height: sH * 0.15,
          width: sW * double.maxFinite,
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
          height: sH * 0.47,
          width: double.maxFinite,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 239, 237),
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //------------------------------------------------------------BMI Text
              Text(
                "Calculate Your BMI",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: sH * 0.03),
              ),
              //--------------------------------------------------------height input
              CustomInputField(
                optionalFunction: () {
                  setState(() {
                    tabIndex = 1;
                  });
                },
                icon: Icons.height,
                fieldName: "Height (m)",
                fieldController: heightController,
              ),

              //--------------------------------------------------------weight input
              CustomInputField(
                optionalFunction: () {
                  setState(() {
                    tabIndex = 1;
                  });
                },
                icon: Icons.boy_rounded,
                fieldName: "Weight (kg)",
                fieldController: weightController,
              ),

              SizedBox(
                height: sH * 0.02,
              ),

              //--------------------------------------------------------BMI output text
              Text(
                res,
                style: TextStyle(
                    fontSize: sW * 0.035, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(height: sH * 0.03),
        //----------------------------------------------------------Calc BMI Button
        ElevatedButton(
            onPressed: () {
              calcBMI((double.tryParse(heightController.text)),
                  double.tryParse(weightController.text));
              tabIndex = 1;
            },
            child: Text(
              "Calculate BMI",
              style: TextStyle(fontSize: sH * 0.025),
            )),
      ]),
    );
  }

//---------------------------------------------------------------------PLAN TAB
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
          //-----------------------------------------------------Monthly Button
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
          //-----------------------------------------------------3 Months Button
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
          //-----------------------------------------------------6 Months Button
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
          //-----------------------------------------------------Yearly Button
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
