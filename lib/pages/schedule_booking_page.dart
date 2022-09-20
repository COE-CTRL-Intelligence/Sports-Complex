import 'package:flutter/material.dart';
import 'package:sports_complex/utils/colors.dart';
import 'package:sports_complex/widgets/custom_date_time.dart';

class ScheduleTimingPage extends StatefulWidget {
  final DateTime? inputTime;
  const ScheduleTimingPage({Key? key, required this.inputTime})
      : super(key: key);

  @override
  State<ScheduleTimingPage> createState() => _ScheduleTimingPageState();
}

class _ScheduleTimingPageState extends State<ScheduleTimingPage> {
  // Variables
  DateTime allowableDate =
      DateTime.now().add(Duration(minutes: 60 - DateTime.now().minute));
  DateTime? startsDateTime;
  DateTime? endsDateTime;
  DurationController durationController = DurationController();

  // Methods
  void updateStartsDateTime(DateTime newDateTime, String target) {
    if (target == 'TIME') {
      if (newDateTime.minute != 0) {
        int newHour = newDateTime.hour;
        if (newDateTime.minute >= 30) {
          debugPrint('ibi true');
          newDateTime = DateTime(newDateTime.year, newDateTime.month,
              newDateTime.day, newHour + 1, 0);
          debugPrint(newDateTime.toString());
        } else {
          debugPrint('ibi lie');
          newDateTime = DateTime(
              newDateTime.year, newDateTime.month, newDateTime.day, newHour, 0);
        }
      }
      setState(() {
        startsDateTime = newDateTime;
        endsDateTime =
            startsDateTime!.add(Duration(hours: durationController.value!));
      });
    } else if (target == 'DATE') {
      setState(() {
        startsDateTime = DateTime(
          newDateTime.year,
          newDateTime.month,
          newDateTime.day,
          startsDateTime!.hour,
          startsDateTime!.minute,
        );
        endsDateTime =
            startsDateTime!.add(Duration(hours: durationController.value!));
      });
    }
  }

  void onDurationPressed() {
    setState(() {
      endsDateTime =
          startsDateTime!.add(Duration(hours: durationController.value!));
    });
  }

  @override
  void initState() {
    super.initState();
    startsDateTime = widget.inputTime!;
  }

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgSample1,
        appBar: AppBar(
          leadingWidth: sW * 0.20,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: sW * 0.12),
            child: Text(
              'New Booking',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.headerColor),
            ),
          ),
          backgroundColor: AppColor.bgSample1,
          elevation: 0,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: sH * 0.02, right: sH * 0.02, top: sH * 0.15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomDateTime(
                          title: 'Starts',
                          allowableDate: allowableDate,
                          updateDateTime: updateStartsDateTime,
                          startDate: startsDateTime!),
                      const SizedBox(height: 40),
                      CustomIncrementWidget(
                        controller: durationController,
                        onPressed: onDurationPressed,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomEndDateTimeField(
                        endDate: endsDateTime ??
                            startsDateTime!.add(const Duration(hours: 1)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: sH * 0.25,
                ),
                // Bottom Place Booking Button
                SizedBox(
                  height: sH * 0.08,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Hello');
                    },
                    child: const Text(
                      'Place Booking',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
