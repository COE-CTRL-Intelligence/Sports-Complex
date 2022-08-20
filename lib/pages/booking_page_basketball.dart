import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BASKETBALL"),
        backgroundColor: const Color.fromARGB(255, 44, 93, 46),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(100, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                onPressed: null,
                child: const Text(
                  "BOOK HERE",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )),
          ),
        ],
      ),
      body: SfCalendar(
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
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: const Color.fromARGB(255, 129, 126, 126).withOpacity(0.4),
        ),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              onPressed: null,
              child: Image.asset("assets/icons/basketball_b.png",
                  color: const Color.fromARGB(255, 31, 95, 33)),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              onPressed: null,
              child: Image.asset("assets/icons/soccerball_b.png",
                  color: const Color.fromARGB(255, 31, 95, 33)),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              onPressed: null,
              child: Image.asset("assets/icons/tennisball_b.png",
                  color: const Color.fromARGB(255, 31, 95, 33)),
            )
          ],
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
