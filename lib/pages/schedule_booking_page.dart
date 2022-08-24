import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';

class ScheduleBookingPage extends StatelessWidget {
  const ScheduleBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startDateController = TextEditingController();
    final endDateController = TextEditingController();
    final startTimeController = TextEditingController();
    final endTimeController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xffC2C3A0),
      appBar: AppBar(
        title: const Text(
          "NEW BOOKING",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 1.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 10),
            child: InkWell(
              onTap: () {},
              child: const Text(
                "Add",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "STARTS",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: TextFormField(
                      onTap: (null),
                      cursorColor: Colors.black,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none),
                      ),
                      controller: startDateController,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 105,
                    child: TextFormField(
                      onTap: (null),
                      cursorColor: Colors.black,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none),
                      ),
                      controller: startTimeController,
                    ),
                  ),
                ],
              ),
              const Text(
                "ENDS",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: TextFormField(
                      onTap: (null),
                      cursorColor: Colors.black,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none),
                      ),
                      controller: endDateController,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 105,
                    child: TextFormField(
                      onTap: (null),
                      cursorColor: Colors.black,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none),
                      ),
                      controller: endTimeController,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
