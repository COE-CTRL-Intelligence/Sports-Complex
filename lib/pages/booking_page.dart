import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/pages/schedule_timing_page.dart';
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
  final calendarController = CalendarController();

  // Methods
  void pushScheduleBooking(DateTime? inputDate) {
    Navigator.of(context).push(PageTransition(
      duration: const Duration(milliseconds: 500),
      type: PageTransitionType.bottomToTop,
      child: ScheduleTimingPage(inputTime: inputDate),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (calendarController.view == CalendarView.week) {
          AutoRouter.of(context).navigate(const SelectSportRoute());
        } else {
          calendarController.view = CalendarView.week;
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: const Color.fromARGB(255, 44, 93, 46),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 6),
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
                    AutoRouter.of(context).push(const ScheduleBookingRoute());
                  },
                  child: const Text(
                    "BOOK HERE",
                    style: TextStyle(color: Colors.white, fontSize: 11.5),
                  )),
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
            if (calendarController.view == CalendarView.day &&
                calendarTapDetails.targetElement ==
                    CalendarElement.calendarCell &&
                calendarTapDetails.date != null &&
                calendarTapDetails.appointments == null) {
              pushScheduleBooking(calendarTapDetails.date);
            }
            if (calendarTapDetails.targetElement ==
                    CalendarElement.calendarCell &&
                calendarController.view == CalendarView.week) {
              calendarController.view = CalendarView.day;
            }
          },
          onLongPress: (calendarLongPressDetails) {
            if (calendarLongPressDetails.appointments == null) {
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
