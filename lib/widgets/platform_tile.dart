import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';

class PlatformTile extends StatelessWidget {
  const PlatformTile({
    Key? key,
    required this.platformName,
    required this.costPerHour,
    required this.image,
    required this.platformID,
  }) : super(key: key);

  final String platformID;
  final String platformName;
  final String costPerHour;
  final ImageProvider image;

  // Methods
  void pushBookingPage(BuildContext context, [bool mounted = true]) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('platformIDPref', platformID);
    if (!mounted) return;
    AutoRouter.of(context)
        .push(BookingRoute(title: platformName, id: platformID));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        splashFactory: NoSplash.splashFactory,
        padding:
            MaterialStateProperty.all(const EdgeInsets.only(left: 0, right: 0)),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: () {
        pushBookingPage(context);
      },
      child: Column(
        children: [
          Image(
            image: image,
            fit: BoxFit.fill,
            width: double.maxFinite,
            height: 120,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 20,
            child: Text(
              '$platformName GH¢ $costPerHour/hour',
              style: const TextStyle(fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
