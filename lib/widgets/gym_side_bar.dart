import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/routes/app_router.gr.dart';

class GymSideBar extends StatefulWidget {
  const GymSideBar({super.key});

  @override
  State<GymSideBar> createState() => _GymSideBarState();
}

class _GymSideBarState extends State<GymSideBar> {
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
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.black),
                )
              ],
            ),
            // const SizedBox(height: 59),
            // ListTile(
            //   leading: const Icon(Icons.home_filled),
            //   title: const Text('Home'),
            //   onTap: () => {},
            // ),
            const SizedBox(height: 15),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("LOGOUT"),
                        content: const Text(
                            "Would you like to log out of your account?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                logout();
                              },
                              child: const Text("Logout")),
                        ],
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    if (!mounted) return;
    AutoRouter.of(context).navigate(const HomeRoute());
  }
}
