import 'package:flutter/material.dart';
import 'package:sports_complex/widgets/custom_input_field.dart';

class ScheduleBookingPage extends StatelessWidget {
  const ScheduleBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final startDateController = TextEditingController();
    final endDateController = TextEditingController();
    final startHourController = TextEditingController();
    final endHourController = TextEditingController();
    final startTimeCategory = TextEditingController();
    final endTimeCategory = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xffC2C3A0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              // Row(children: const [Text("Start")]),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     CustomInputField(
              //         fieldController: startDateController,
              //         fieldName: "Start Date",
              //         obscureText: false),
              //     CustomInputField(
              //         fieldController: startHourController,
              //         fieldName: "Start Time",
              //         obscureText: false),
              //     CustomInputField(
              //         fieldController: startTimeCategory,
              //         fieldName: "Start Time",
              //         obscureText: false)
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
