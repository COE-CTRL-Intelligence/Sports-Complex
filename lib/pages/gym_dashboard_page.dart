// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// import 'package:sports_complex/pages/routes/app_router.gr.dart';

// class GymDashboardPage extends StatefulWidget {
//   const GymDashboardPage({super.key});

//   @override
//   State<GymDashboardPage> createState() => _GymDashboardPageState();
// }

// class _GymDashboardPageState extends State<GymDashboardPage> {
//   // Variables

//   // Methods
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   getUserData();
// }

// void logout() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   pref.clear();
//   if (!mounted) return;
//   AutoRouter.of(context).navigate(const HomeRoute());
// }

//   @override
//   Widget build(BuildContext context) {
// return WillPopScope(
//   onWillPop: () async {
//     AutoRouter.of(context).navigate(const HomeRoute());
//     return false;
//       },
//       child: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Gym Dashboard'),
//             actions: [
//               Padding(
//                   padding: const EdgeInsets.only(right: 20),
//                   child: IconButton(
//                     icon: const Icon(Icons.logout),
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: const Text("LOGOUT"),
//                             content: const Text(
//                                 "Would you like to log out of your account?"),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: const Text("Cancel"),
//                               ),
//                               TextButton(
//                                   onPressed: () {
//                                     logout();
//                                   },
//                                   child: const Text("Logout")),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ))
//             ],
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 userData['gender'] == 'M'
//                     ? const Icon(
//                         Icons.man,
//                         color: Colors.blue,
//                         size: 100,
//                       )
//                     : const Icon(
//                         Icons.woman,
//                         size: 100,
//                         color: Colors.pink,
//                       ),
// Text('Hello ${userData["name"]}'),
// const SizedBox(height: 15),
// Text('Your Email: ${userData["email"]}')
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:sports_complex/widgets/gym_side_bar';

class GymDashboardPage extends StatefulWidget {
  const GymDashboardPage({Key? key}) : super(key: key);

  @override
  State<GymDashboardPage> createState() => _GymDashboardPageState();
}

Map<String, dynamic> userData = {};

class _GymDashboardPageState extends State<GymDashboardPage>
    with TickerProviderStateMixin {
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
    pref.clear();
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

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return WillPopScope(
        onWillPop: () async {
          AutoRouter.of(context).navigate(const HomeRoute());
          return false;
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 229, 230, 228),
          // endDrawer: const GymSideBar(),
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
                  SizedBox(
                    width: 400,
                    height: 150,
                    child: TabBarView(controller: tabController, children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 239, 239, 237),
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello ${userData["name"]},',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
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
                      // SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 239, 239, 237),
                            borderRadius: BorderRadius.circular(18)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Monthly Bundle',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: (FontWeight.bold))),
                            SizedBox(height: 4),
                            Text(
                              "Expires: 26/09/22",
                            ),
                            SizedBox(height: 4),
                            Text("Paid with: Momo")
                          ],
                        ),
                      ),
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

  Widget buildProfileImage() => const CircleAvatar(
        radius: 24,
        backgroundColor: Color.fromARGB(255, 224, 219, 219),
        child: Icon(Icons.person, color: Colors.black),
      );
}
