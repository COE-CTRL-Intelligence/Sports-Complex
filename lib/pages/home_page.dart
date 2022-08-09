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
            padding: const EdgeInsets.only(top: 99, bottom: 50),
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
