import 'package:flutter/material.dart';

class SportifyLogo extends StatelessWidget {
  const SportifyLogo({
    Key? key,
    required this.logoSize,
  }) : super(key: key);

  final double logoSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultTextStyle(
          style: TextStyle(
            fontFamily: "DroidSans",
            color: const Color(0xffFEF7C0),
            fontSize: logoSize,
          ),
          child: const Text("SPORT"),
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontFamily: "DroidSans",
            color: const Color(0xff83D475),
            fontSize: logoSize,
          ),
          child: const Text("IFY"),
        ),
      ],
    );
  }
}
