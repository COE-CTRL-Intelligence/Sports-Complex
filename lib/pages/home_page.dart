// ignore_for_file: unnecessary_const

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/background_image_widget.dart';
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
          body: Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 100),
            child: Column(
              children: [
                Hero(
                  tag: 'dumbell_logo',
                  child: SizedBox(
                    height: 65,
                    child: Image.asset(
                      "assets/icons/dumbbell.png",
                      color: const Color(0xffFEF7C0),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(120, 120)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(217, 217, 217, 217),
                        ),
                      ),
                      onPressed: () {
                        AutoRouter.of(context).push(const SelectSportRoute());
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          const Text('BOOK A FACILITY',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black,
                                height: 2.3,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(const Size(120, 120)),
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(217, 217, 217, 217),
                          ),
                        ),
                        onPressed: () {
                          AutoRouter.of(context)
                              .push(const CheckBookingRoute());
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/icons/calendar.png",
                              height: 30,
                            ),
                            const Text(
                              "CHECK BOOKING",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  height: 2),
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(120, 120)),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(217, 217, 217, 217),
                    ),
                  ),
                  onPressed: () {
                    AutoRouter.of(context).push(const GymLoginRoute());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.values.last,
                    children: [
                      Image.asset(
                        "assets/icons/dumbbell.png",
                        color: Colors.black,
                        height: 50,
                      ),
                      const Text(
                        "GYM",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
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
    );
  }
}
