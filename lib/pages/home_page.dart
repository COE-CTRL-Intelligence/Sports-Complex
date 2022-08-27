// ignore_for_file: unnecessary_const

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/background_image_widget.dart';
import 'package:sports_complex/widgets/home_page_button.dart';
import 'package:sports_complex/widgets/sportify_logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
      image: const AssetImage("assets/images/bg.jpg"),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Hero(
                    tag: 'dumbell_logo',
                    child: Image.asset(
                      height: 65,
                      "assets/icons/dumbbell.png",
                      color: const Color(0xffFEF7C0),
                    ),
                  ),
                  const SizedBox(height: 45),
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
                      const SizedBox(
                        height: 15,
                      ),
                      HomePageButton(
                        icon: Image.asset(
                          "assets/icons/dumbbell.png",
                          color: Colors.black,
                          height: 50,
                        ),
                        title: "GYM",
                        onPressed: () {
                          AutoRouter.of(context).push(const GymLoginRoute());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
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
    );
  }
}
