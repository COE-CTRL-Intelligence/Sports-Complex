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
    // TODO: implement initState
    super.initState();
    startsDateTime = widget.inputTime!;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgSample1,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
          leadingWidth: screenWidth * 0.2,
          leading: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 20, color: Color(0xffFF1E00)),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12),
            child: Text(
              'New Booking',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppColor.headerColor),
            ),
          ),
          backgroundColor: AppColor.bgSample1,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 30, right: 30, top: screenHeight * 0.15),
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
                  height: screenHeight * 0.306,
                ),
                // Bottom Place Booking Button
                SizedBox(
                  height: screenHeight * 0.09,
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
