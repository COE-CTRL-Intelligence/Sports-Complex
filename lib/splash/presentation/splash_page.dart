import 'package:flutter/material.dart';
import 'package:sports_complex/core/shared/background_image_widget.dart';

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 65,
                      child: Image.asset(
                        "assets/icons/dumbell.png",
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
                    )),
                  ],
                ),
              ))),
    );
  }
}
