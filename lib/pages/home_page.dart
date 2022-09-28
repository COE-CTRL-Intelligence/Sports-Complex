import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/background_image_widget.dart';
import 'package:sports_complex/widgets/home_page_button.dart';
import 'package:sports_complex/widgets/sportify_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables
  bool ignore = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        ignore = false;
      });
    });
  }

  // Check if user already logged in
  void isUserLogged() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('gymPassPref');
    if (token != null) {
      if (!mounted) return;
      AutoRouter.of(context).push(const GymDashboardRoute());
    } else {
      if (!mounted) return;
      AutoRouter.of(context).push(const GymLoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return BackgroundImageWidget(
      image: const AssetImage("assets/images/bg.jpg"),
      child: SafeArea(
        child: IgnorePointer(
          ignoring: ignore,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  children: [
                    // Head
                    Hero(
                      tag: 'dumbell_logo',
                      child: Image.asset(
                        height: 65,
                        "assets/icons/dumbbell.png",
                        color: const Color(0xffFEF7C0),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.1),

                    // Body
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HomePageButton(
                              icon: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        "assets/icons/tennisball.png",
                                        color: Colors.black,
                                        height: 29,
                                      ),
                                      Image.asset(
                                        "assets/icons/basketball.png",
                                        color: Colors.black,
                                        height: 25,
                                      ),
                                    ],
                                  ),
                                  Image.asset("assets/icons/soccerball.png",
                                      color: Colors.black, height: 25),
                                ],
                              ),
                              title: 'BOOK FACILITY',
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(const SelectSportRoute());
                              },
                            ),
                            HomePageButton(
                              icon: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Image.asset(
                                  "assets/icons/calendar.png",
                                  height: 30,
                                ),
                              ),
                              title: "CHECK BOOKING",
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(const CheckBookingRoute());
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        HomePageButton(
                          icon: Image.asset(
                            "assets/icons/dumbbell.png",
                            color: Colors.black,
                            height: 50,
                          ),
                          title: "GYM",
                          onPressed: () {
                            isUserLogged();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.1),

                    // Tail
                    const Hero(
                      tag: 'sportify_logo',
                      child: Center(
                        child: SportifyLogo(logoSize: 36),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
