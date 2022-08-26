import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/background_image_widget.dart';
import 'package:sports_complex/widgets/sportify_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    debugPrint('We made it');
    _navigateToHomePage();
  }

  void _navigateToHomePage() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      AutoRouter.of(context).replace(const HomeRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageWidget(
        image: const AssetImage("assets/images/bg.jpg"),
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'dumbell_logo',
                      child: SizedBox(
                        height: 100,
                        child: Image.asset(
                          "assets/icons/dumbbell.png",
                          color: const Color(0xffFEF7C0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Hero(
                      tag: 'sportify_logo',
                      child: Center(
                        child: SportifyLogo(logoSize: 45),
                      ),
                    ),
                  ])),
        ));
  }
}


// Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/bulb.jpg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: null /* add child content here */,
//       )