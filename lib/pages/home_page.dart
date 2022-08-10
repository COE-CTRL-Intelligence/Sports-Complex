// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
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
                    "assets/icons/dumbell.png",
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
                                    const CircleBorder()),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(217, 217, 217, 217),
                                ),
                              ),
                              onPressed: null,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text('i01'),
                                      Text('i02'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text('i03'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                    const Size(120, 120)),
                                shape: MaterialStateProperty.all(
                                    const CircleBorder()),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(217, 217, 217, 217),
                                ),
                              ),
                              onPressed: null,
                              child: null,
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
                                    const CircleBorder()),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(217, 217, 217, 217),
                                ),
                              ),
                              onPressed: null,
                              child: null,
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
