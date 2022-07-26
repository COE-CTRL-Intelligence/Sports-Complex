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
  final Booking? appointment;

  const BookingPage(
      {Key? key, required this.title, required this.id, this.appointment})
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
        if (jsonData.isNotEmpty) {
          var bookingList = jsonDecode(jsonData)
              .map<Booking>((data) => Booking.fromJson(data))
              .toList();
          setState(() {
            bookings = bookingList;

            if (bookings != null) {
              appointments = getAppointments(bookings!, today);
            }
          });
        }
      } else {
        debugPrint('Something went wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<Appointment> getAppointments(List<Booking> bookings, DateTime minDate) {
    List<Appointment> meetings = <Appointment>[];

    if (bookings.isNotEmpty) {
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
            color: (bookings.last == booking && widget.appointment != null)
                ? Colors.blue
                : AppColor.pink1,
            subject: (bookings.last == booking && widget.appointment != null)
                ? 'New'
                : ''));
      }
    }
    if (widget.appointment != null) {
      calendarController.displayDate = widget.appointment!.startTime;
    }

    return meetings;
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
          backgroundColor: Color.fromARGB(255, 90, 158, 93),
          actions: [
            Visibility(
              visible: bookHereVisibility,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(100, 50)),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 78, 159, 80)),
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
                firstDayOfWeek: DateTime.now().weekday == 1
                    ? 7
                    : DateTime.now().weekday - 1,
                controller: calendarController,
                minDate: today.add(Duration(minutes: 60 - today.minute)),
                maxDate: DateTime.now().add(const Duration(days: 365)),
                selectionDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Color.fromARGB(255, 116, 203, 133), width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  shape: BoxShape.rectangle,
                ),
                showDatePickerButton:
                    calendarController.view == CalendarView.day,
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

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
