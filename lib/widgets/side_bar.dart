import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Image.asset("assets/icons/dumbbell.png", height: 30),
                )
              ],
            ),
            const SizedBox(height: 59),
            ListTile(
              leading: const Icon(Icons.home_filled),
              title: const Text('Home'),
              onTap: () => {AutoRouter.of(context).popUntilRoot()},
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Gym'),
              onTap: () => {
                AutoRouter.of(context).replaceAll([
                  const HomeRoute(),
                  const GymLoginRoute(),
                ])
              },
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: const Icon(Icons.hotel_class_rounded),
              title: const Text('Book a facility'),
              onTap: () {
                // debugPrint(context.debugDoingBuild);
                AutoRouter.of(context)
                    .replaceAll([const HomeRoute(), const SelectSportRoute()]);
              },
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: const Icon(Icons.free_cancellation_rounded),
              title: const Text('Check booking'),
              onTap: () => {
                AutoRouter.of(context)
                    .replaceAll([const HomeRoute(), const CheckBookingRoute()])
              },
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: const Icon(Icons.contact_support),
              title: const Text('Contact us'),
              onTap: () => {
                AutoRouter.of(context)
                    .replaceAll([const HomeRoute(), ContactUsRoute()])
              },
            ),
            const SizedBox(height: 15),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () => {
                AutoRouter.of(context)
                    .replaceAll([const HomeRoute(), const AboutRoute()])
              },
            ),
          ],
        ),
      ),
    );
  }
}
