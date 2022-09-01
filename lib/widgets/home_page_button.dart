import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget icon;
  final String title;
  const HomePageButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(128, 125)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(217, 217, 217, 217),
          ),
        ),
        onPressed: () {
          onPressed!();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    height: 2),
              ),
            ],
          ),
        ));
  }
}
