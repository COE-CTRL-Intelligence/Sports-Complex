// ignore_for_file: unnecessary_const

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/background_image_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundImageWidget(
        image: const AssetImage("assets/images/bg.jpg"),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 65,
                  child: Image.asset(
                    "assets/icons/dumbbell.png",
                    color: const Color(0xffFEF7C0),
                  ),
                ),
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(120, 120)),
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(217, 217, 217, 217),
                                ),
                              ),
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(const BookingRoute());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset("assets/icons/soccerball.png",
                                          color: Colors.black, height: 25),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'BOOK A FACILITY',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.black,
                                          height: 2.3,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(120, 120)),
                                  shape: MaterialStateProperty.all(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(217, 217, 217, 217),
                                  ),
                                ),
                                onPressed: () {
                                  AutoRouter.of(context)
                                      .push(const CheckBookingRoute());
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: const [],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/icons/calendar.png",
                                          height: 30,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              "CHECK BOOKING",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  height: 2),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ))
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(120, 120)),
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)))),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(217, 217, 217, 217),
                                ),
                              ),
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(const GymLoginRoute());
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.values.last,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/dumbbell.png",
                                        color: Colors.black,
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "GYM",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ]),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Sport",
                        style: TextStyle(
                          fontFamily: "DroidSans",
                          color: Color(0xffFEF7C0),
                          fontSize: 36,
                        ),
                      ),
                      Text(
                        "ify",
                        style: TextStyle(
                          fontFamily: "DroidSans",
                          color: Color(0xff83D475),
                          fontSize: 36,
                        ),
                      ),
                    ],
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
