import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';

class PlatformTile extends StatelessWidget {
  const PlatformTile({
    Key? key,
    required this.platformName,
    required this.costPerHour,
    required this.image,
  }) : super(key: key);
  final String platformName;
  final String costPerHour;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(const EdgeInsets.only(left: 0, right: 0)),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: () {
        AutoRouter.of(context).push(BookingRoute(title: platformName));
      },
      child: Column(
        children: [
          Image(
            image: image,
            fit: BoxFit.fill,
            width: 300,
            height: 120,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 20,
            child: Text(
              '$platformName GHc $costPerHour/hour',
              style: const TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
