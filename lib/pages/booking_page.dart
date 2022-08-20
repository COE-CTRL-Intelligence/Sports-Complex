import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: Column(
        children: [
          SizedBox(
              height: 600,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0, top: 40),
                child: SfCalendar(
                  headerStyle: const CalendarHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  view: CalendarView.week,
                  dataSource: MeetingDataSource(getAppointments()),
                ),
              )),
          Row(
            children: [],
          )
        ],
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
    subject: 'Conference',
    color: Colors.green,
  ));

  meetings.add(Appointment(
    startTime: DateTime(2022, 8, 19, 9, 0, 0),
    endTime: DateTime(2022, 8, 19, 11, 0, 0),
    subject: "Kwame's Test",
    color: Colors.black,
  ));

  meetings.add(Appointment(
    startTime: DateTime(2022, 8, 19, 23, 0, 0),
    endTime: DateTime(2022, 8, 19, 23, 0, 0).add(const Duration(hours: 3)),
    subject: "Checking Something",
    color: Colors.black,
    notes: "hi",
  ));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
