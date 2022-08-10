import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/background_image_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundImageWidget(
          image: const AssetImage("assets/images/bg.jpg"),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      SizedBox(
                        height: 65,
                        child: Image.asset(
                          "assets/icons/dumbbell.png",
                          color: const Color(0xffFEF7C0),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("SPORT",
                                style: TextStyle(
                                  fontFamily: "DroidSans",
                                  color: Color(0xffFEF7C0),
                                  fontSize: 36,
                                )),
                            Text(
                              "IFY",
                              style: TextStyle(
                                fontFamily: "DroidSans",
                                color: Color(0xff83D475),
                                fontSize: 36,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff83D475),
                            ),
                          ),
                          onPressed: () {
                            AutoRouter.of(context).push(const HomeRoute());
                          },
                          child: const Text("HOME")),
                    )
                  ],
                ),
              ))),
    );
  }
}
