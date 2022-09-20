import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/pages/schedule_booking_page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingPage extends StatefulWidget {
  final String title;

  const BookingPage({Key? key, required this.title}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  // Variables
  DateTime today = DateTime.now();
  DateTime? minDate;
  Timer? timer;
  final calendarController = CalendarController();
  bool bookHereVisibility = false;

  // Methods
  void pushScheduleBooking(DateTime? inputDate) {
    String? inDateString =
        DateFormat('d MMM y').format(calendarController.displayDate!);
    String? todayString = DateFormat('d MMM y').format(today);
    String? selectedString =
        DateFormat('d MMM y').format(calendarController.selectedDate!);
    DateTime pushedDate;

    if (inputDate == null) {
      if (calendarController.view == CalendarView.day &&
          inDateString == todayString) {
        pushedDate = minDate!;
        setState(() {
          calendarController.selectedDate = minDate;
        });
      } else {
        pushedDate = calendarController.displayDate!;
        setState(() {
          calendarController.selectedDate = calendarController.displayDate;
        });
      }
    } else {
      if (inDateString == selectedString) {
        pushedDate = inputDate;
      } else if (inDateString == todayString) {
        pushedDate = minDate!;
        setState(() {
          calendarController.selectedDate = minDate;
        });
      } else {
        pushedDate = calendarController.displayDate!;
      }
    }

    Navigator.of(context).push(PageTransition(
      duration: const Duration(milliseconds: 500),
      type: PageTransitionType.bottomToTop,
      child: ScheduleTimingPage(inputTime: pushedDate),
    ));
  }

  void refreshHourlySchedule() {
    minDate =
        today.add(Duration(seconds: 3600 - today.second - (60 * today.minute)));
    Duration nextHourDuration = minDate!.difference(today);
    timer = Timer.periodic(nextHourDuration, (timer) {
      setState(() {
        today = DateTime.now();
        minDate = today
            .add(Duration(seconds: 3600 - today.second - (60 * today.minute)));
      });
    });
  }

  void updateBookHereVisibility() {
    if (calendarController.view == CalendarView.day) {
      setState(() {
        bookHereVisibility = true;
      });
    } else {
      setState(() {
        bookHereVisibility = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    refreshHourlySchedule();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (calendarController.view == CalendarView.week) {
          AutoRouter.of(context).navigate(const SelectSportRoute());
        } else {
          calendarController.view = CalendarView.week;
          updateBookHereVisibility();
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: const Color.fromARGB(255, 44, 93, 46),
          actions: [
            Visibility(
              visible: bookHereVisibility,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(100, 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                    ),
                    onPressed: () {
                      pushScheduleBooking(calendarController.selectedDate);
                    },
                    child: const Text(
                      "BOOK HERE",
                      style: TextStyle(color: Colors.white, fontSize: 11.5),
                    )),
              ),
            ),
          ],
        ),
        body: SfCalendar(
          firstDayOfWeek:
              DateTime.now().weekday == 1 ? 7 : DateTime.now().weekday - 1,
          controller: calendarController,
          minDate: today.add(Duration(minutes: 60 - today.minute)),
          maxDate: DateTime.now().add(const Duration(days: 365)),
          selectionDecoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            shape: BoxShape.rectangle,
          ),
          showDatePickerButton: true,
          allowedViews: const [CalendarView.day, CalendarView.week],
          headerStyle: const CalendarHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          view: CalendarView.week,
          dataSource: MeetingDataSource(getAppointments()),
          onTap: (calendarTapDetails) {
            // from DayView to ScheduleBooking Page/Popup
            if (calendarController.view == CalendarView.day &&
                calendarTapDetails.targetElement ==
                    CalendarElement.calendarCell &&
                calendarTapDetails.date != null &&
                calendarTapDetails.appointments == null) {
              pushScheduleBooking(calendarTapDetails.date);
            }

            // form WeekView to DayView
            if (calendarTapDetails.targetElement ==
                    CalendarElement.calendarCell &&
                calendarController.view == CalendarView.week) {
              calendarController.view = CalendarView.day;
              updateBookHereVisibility();
            }
          },
          onLongPress: (calendarLongPressDetails) {
            if (calendarLongPressDetails.appointments == null &&
                calendarLongPressDetails.targetElement ==
                    CalendarElement.calendarCell) {
              pushScheduleBooking(calendarLongPressDetails.date);
            }
          },
        ),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    subject: 'Booked',
    color: Colors.redAccent,
  ));

  meetings.add(Appointment(
    startTime: startTime.add(const Duration(hours: 2)),
    endTime: startTime.add(const Duration(hours: 4)),
    subject: "Booked",
    color: Colors.redAccent,
  ));

  meetings.add(Appointment(
    startTime: today.add(const Duration(days: 3)),
    endTime: today.add(const Duration(days: 3, hours: 1)),
    subject: "Booked",
    color: Colors.redAccent,
    notes: "hi",
  ));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
