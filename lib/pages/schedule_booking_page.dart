import 'package:flutter/material.dart';

class ScheduleBookingPage extends StatefulWidget {
  const ScheduleBookingPage({Key? key}) : super(key: key);

  @override
  State<ScheduleBookingPage> createState() => _ScheduleBookingPageState();
}

class _ScheduleBookingPageState extends State<ScheduleBookingPage> {
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  var text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC2C3A0),
      appBar: AppBar(
        title: const Text(
          "NEW BOOKING",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 1.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 10),
            child: InkWell(
              onTap: () {},
              child: const Text(
                "Add",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(text),
              const Text(
                "STARTS",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year),
                          lastDate: DateTime(DateTime.now().year + 2),
                        ).then((date) => setState(
                              () {
                                text = date.toString();
                              },
                            ));
                      },
                      cursorColor: Colors.black,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 10),
                        hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        hintText: "Start Date",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none),
                      ),
                      controller: startDateController,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 105,
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                      },
                      cursorColor: Colors.black,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 10),
                        hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        hintText: "Start Time",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none),
                      ),
                      controller: startTimeController,
                    ),
                  ),
                ],
              ),
              const Text(
                "ENDS",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: TextFormField(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year),
                          lastDate: DateTime(DateTime.now().year + 2),
                        ).then((date) => setState(
                              () {
                                text = date.toString();
                              },
                            ));
                      },
                      readOnly: true,
                      cursorColor: Colors.black,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 10),
                        hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        hintText: "End Date",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none),
                      ),
                      controller: endDateController,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 105,
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                      },
                      cursorColor: Colors.black,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 10),
                        hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                        hintText: "End Time",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none),
                      ),
                      controller: endTimeController,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
