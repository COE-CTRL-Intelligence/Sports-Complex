import 'dart:async';
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sports_complex/models/booking.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/pages/schedule_booking_page.dart';
import 'package:sports_complex/utils/colors.dart';
import 'package:sports_complex/utils/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:http/http.dart' as http;

class BookingPage extends StatefulWidget {
  final String title;
  final String id;

  const BookingPage({Key? key, required this.title, required this.id})
      : super(key: key);

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
  List<Appointment>? appointments;
  List<Booking>? bookings;

  // Methods
  void pushScheduleBooking({DateTime? inputDate, bool? longPressed = false}) {
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
      if (inDateString == selectedString || longPressed == true) {
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

    if (pushedDate.minute > 0) {
      pushedDate = pushedDate.subtract(
          Duration(minutes: pushedDate.minute + (60 * pushedDate.hour)));
    }

    Navigator.of(context).push(PageTransition(
      duration: const Duration(milliseconds: 500),
      type: PageTransitionType.bottomToTop,
      child:
          ScheduleBookingPage(inputTime: pushedDate, bookedDates: appointments),
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

  void getBookings() async {
    try {
      var response = await http.get(Uri.parse('$baseURL/bookings/${widget.id}'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      if (response.statusCode == 200 && mounted) {
        var jsonData = response.body;
        setState(() {
          bookings = jsonDecode(jsonData)
              .map<Booking>((data) => Booking.fromJson(data))
              .toList();
          appointments = getAppointments(bookings!, today);
        });
      } else {
        debugPrint('Something went wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getBookings();
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
                      pushScheduleBooking(
                          inputDate: calendarController.selectedDate);
                    },
                    child: const Text(
                      "BOOK HERE",
                      style: TextStyle(color: Colors.white, fontSize: 11.5),
                    )),
              ),
            ),
          ],
        ),
        body: bookings != null
            ? SfCalendar(
                appointmentBuilder: (context, calendarAppointmentDetails) {
                  return Container(
                    color: AppColor.pink1,
                    child: Center(
                      child: Text(calendarAppointmentDetails
                          .appointments.first.subject),
                    ),
                  );
                },
                firstDayOfWeek: DateTime.now().weekday == 1
                    ? 7
                    : DateTime.now().weekday - 1,
                controller: calendarController,
                minDate: today.add(Duration(minutes: 60 - today.minute)),
                maxDate: DateTime.now().add(const Duration(days: 365)),
                selectionDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  shape: BoxShape.rectangle,
                ),
                showDatePickerButton:
                    calendarController.view == CalendarView.day,
                // allowedViews: const [CalendarView.day, CalendarView.week],
                headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                view: CalendarView.week,
                dataSource: MeetingDataSource(appointments!),
                onTap: (calendarTapDetails) {
                  // from DayView to ScheduleBooking Page/Popup
                  if (calendarController.view == CalendarView.day &&
                      calendarTapDetails.targetElement ==
                          CalendarElement.calendarCell &&
                      calendarTapDetails.date != null &&
                      calendarTapDetails.appointments == null) {
                    pushScheduleBooking(inputDate: calendarTapDetails.date);
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
                    pushScheduleBooking(
                        inputDate: calendarLongPressDetails.date,
                        longPressed: true);
                  }
                },
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

List<Appointment> getAppointments(List<Booking> bookings, DateTime minDate) {
  List<Appointment> meetings = <Appointment>[];

  for (Booking booking in bookings) {
    if (booking.startTime.isBefore(minDate) &&
        booking.endTime.isBefore(minDate)) {
      continue;
    }

    if (booking.startTime.isBefore(minDate)) {
      booking.startTime = DateTime(
          booking.startTime.year,
          booking.startTime.month,
          booking.startTime.day,
          minDate.hour,
          minDate.minute,
          0,
          0,
          0);
    }

    meetings.add(Appointment(
        startTime: booking.startTime,
        endTime: booking.endTime,
        // color: AppColor.pink1,
        subject: ''));
  }

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
