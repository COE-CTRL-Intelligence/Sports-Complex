import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/utils/colors.dart';
import 'package:sports_complex/utils/custom_methods.dart';
import 'package:sports_complex/widgets/custom_date_time.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleBookingPage extends StatefulWidget {
  const ScheduleBookingPage(
      {Key? key, required this.inputTime, this.bookedDates})
      : super(key: key);

  final DateTime? inputTime;
  final List<Appointment>? bookedDates;

  @override
  State<ScheduleBookingPage> createState() => _ScheduleBookingPageState();
}

class _ScheduleBookingPageState extends State<ScheduleBookingPage> {
  // Variables
  DateTime allowableDate =
      DateTime.now().add(Duration(minutes: 60 - DateTime.now().minute));
  DateTime? startsDateTime;
  DateTime? endsDateTime;
  DurationController durationController = DurationController();
  bool? isDateValid;

  // Methods
  void updateStartsDateTime(DateTime newDateTime, String target) {
    if (target == 'TIME') {
      if (newDateTime.minute != 0) {
        int newHour = newDateTime.hour;
        if (newDateTime.minute >= 30) {
          newDateTime = DateTime(newDateTime.year, newDateTime.month,
              newDateTime.day, newHour + 1, 0);
        } else {
          newDateTime = DateTime(
              newDateTime.year, newDateTime.month, newDateTime.day, newHour, 0);
        }
      }
      setState(() {
        startsDateTime = newDateTime;
        endsDateTime =
            startsDateTime!.add(Duration(hours: durationController.value!));
        refreshDateValidity();
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
        refreshDateValidity();
      });
    }
  }

  void onDurationPressed() {
    setState(() {
      endsDateTime =
          startsDateTime!.add(Duration(hours: durationController.value!));
      refreshDateValidity();
    });
  }

  void refreshDateValidity() {
    Appointment currentAppointment = Appointment(
        startTime: startsDateTime!,
        endTime:
            startsDateTime!.add(Duration(hours: durationController.value!)));
    for (Appointment appointment in widget.bookedDates!) {
      if (isPeriodAvailable(currentAppointment, appointment)) {
        setState(() {
          isDateValid = true;
        });
      } else {
        setState(() {
          isDateValid = false;
        });
        break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    startsDateTime = widget.inputTime!;
    durationController.value = 1;
    refreshDateValidity();
  }

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.cream1,
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
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: sW * 0.12),
            child: Text(
              'New Booking',
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: AppColor.blue1),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: sH * 0.02,
                    right: sH * 0.02,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isDateValid != true
                          ? const Text('Date not available!',
                              style: TextStyle(color: Colors.red))
                          : const SizedBox(),
                      SizedBox(height: sH * 0.12),
                      CustomDateTime(
                          title: 'STARTS',
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
                            startsDateTime!.add(
                                Duration(hours: durationController.value!)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: sH * 0.25,
                ),
                // Bottom Place Booking Button
                SizedBox(
                  height: sH * 0.07,
                  width: sW * 0.7,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    onPressed: isDateValid != true
                        ? null
                        : (() {
                            AutoRouter.of(context).push(const PaymentRoute());
                          }),
                    child: const Text(
                      'Place Booking',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
