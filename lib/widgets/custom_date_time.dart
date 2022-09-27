import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_complex/utils/colors.dart';

class CustomDateTime extends StatelessWidget {
  const CustomDateTime({
    super.key,
    required this.allowableDate,
    required this.startDate,
    required this.updateDateTime,
    required this.title,
  });

  final String title;
  final DateTime allowableDate;
  final DateTime startDate;
  final Function updateDateTime;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.2,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: AppColor.blue1,
            ),
          ),
        ),
        DateLabel(
          allowableDate: allowableDate,
          selectedDate: startDate,
          updateDate: updateDateTime,
        ),
        const SizedBox(width: 15),
        TimeLabel(
          selectedTime: startDate,
          updateTime: updateDateTime,
          allowableDate: allowableDate,
        ),
      ],
    );
  }
}

class CustomEndDateTimeField extends StatelessWidget {
  const CustomEndDateTimeField({super.key, this.endDate});

  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.2,
          child: Text(
            'ENDS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: AppColor.blue1,
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            alignment: Alignment.center,
            height: 50,
            child: Text(DateFormat('d MMM y').format(endDate!),
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.blue1.withOpacity(0.5),
                  fontSize: 20,
                ))),
        const SizedBox(width: 15),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              alignment: Alignment.center,
              height: 50,
              child: Text(DateFormat.jm().format(endDate!),
                  style: TextStyle(
                      color: AppColor.blue1.withOpacity(0.5), fontSize: 20))),
        ),
      ],
    );
  }
}

class TimeLabel extends StatelessWidget {
  const TimeLabel({
    Key? key,
    required this.selectedTime,
    required this.updateTime,
    required this.allowableDate,
  }) : super(key: key);

  final DateTime? selectedTime; // Converted to TimeOfDay where needed
  final DateTime allowableDate;
  final Function updateTime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () async {
        // if Android
        if (Platform.isAndroid) {
          TimeOfDay? time = await showTimePicker(
              initialEntryMode: TimePickerEntryMode.input,
              context: context,
              initialTime: TimeOfDay.fromDateTime(selectedTime!));
          try {
            DateTime? newDate = DateTime(
              selectedTime!.year,
              selectedTime!.month,
              selectedTime!.day,
              time!.hour,
              time.minute,
            );
            updateTime(newDate, 'TIME');
          } catch (e) {
            null;
          }
        }
        // if IOS
        else if (Platform.isIOS) {
          showCupertinoModalPopup(
              context: context,
              builder: (context) => Container(
                    color: Colors.white70,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: selectedTime,
                        minimumDate: allowableDate.subtract(Duration(
                            hours: allowableDate.hour,
                            minutes: allowableDate.minute,
                            seconds: allowableDate.second,
                            milliseconds: allowableDate.millisecond,
                            microseconds: allowableDate.microsecond)),
                        maximumDate:
                            allowableDate.add(const Duration(days: 365)),
                        onDateTimeChanged: (value) =>
                            updateTime(value, 'TIME')),
                  ));
        }
      },
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          alignment: Alignment.center,
          height: 50,
          child: Text(DateFormat.jm().format(selectedTime!),
              style: TextStyle(color: AppColor.blue1, fontSize: 20))),
    ));
  }
}

class DateLabel extends StatelessWidget {
  final DateTime allowableDate;
  final DateTime? selectedDate;
  final Function updateDate;
  const DateLabel(
      {Key? key,
      required this.selectedDate,
      required this.updateDate,
      required this.allowableDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // If Android
        if (Platform.isAndroid) {
          DateTime? newDate = await showDatePicker(
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              context: context,
              initialDate: selectedDate!,
              firstDate: allowableDate,
              lastDate: allowableDate.add(const Duration(days: 365)));
          try {
            updateDate(newDate, 'DATE');
          } catch (e) {
            null;
          }
        } else if (Platform.isIOS) {
          // if IOS
          showCupertinoModalPopup(
              context: context,
              builder: (context) => Container(
                    color: Colors.white70,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: selectedDate,
                        minimumDate: allowableDate.subtract(Duration(
                            hours: allowableDate.hour,
                            minutes: allowableDate.minute,
                            seconds: allowableDate.second,
                            milliseconds: allowableDate.millisecond,
                            microseconds: allowableDate.microsecond)),
                        maximumDate:
                            allowableDate.add(const Duration(days: 365)),
                        onDateTimeChanged: (value) =>
                            updateDate(value, 'DATE')),
                  ));
        }
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          alignment: Alignment.center,
          height: 50,
          child: Text(DateFormat('d MMM y').format(selectedDate!),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: AppColor.blue1, fontSize: 20))),
    );
  }
}

class DurationController {
  int? value;
}

class CustomIncrementWidget extends StatefulWidget {
  const CustomIncrementWidget({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  final DurationController? controller;
  final Function onPressed;

  @override
  State<CustomIncrementWidget> createState() => _CustomIncrementWidgetState();
}

class _CustomIncrementWidgetState extends State<CustomIncrementWidget> {
  // Variables
  int value = 1;

  // Methods
  void increment() {
    DurationController? durationController = widget.controller;
    if (value < 9) {
      setState(() {
        value = value + 1;
        durationController!.value = value;
      });
    }
  }

  void decrement() {
    DurationController? durationController = widget.controller;
    if (value > 1) {
      setState(() {
        value = value - 1;
        durationController!.value = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    DurationController? durationController = widget.controller;
    durationController!.value = value;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.3,
          child: Text(
            'DURATION',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: AppColor.blue1,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (value != 1) {
              decrement();
              widget.onPressed();
            }
          },
          child: Container(
            width: screenWidth * 0.15,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            alignment: Alignment.center,
            height: 50,
            child: Icon(
              Icons.remove,
              color: (value != 1)
                  ? AppColor.blue1
                  : AppColor.blue1.withOpacity(0.5),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            value.toString(),
            style: TextStyle(color: AppColor.blue1, fontSize: 25),
          ),
        ),
        GestureDetector(
            onTap: () {
              if (value != 9) {
                increment();
                widget.onPressed();
              }
            },
            child: Container(
                width: screenWidth * 0.15,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                alignment: Alignment.center,
                height: 50,
                child: Icon(
                  Icons.add,
                  color: (value != 9)
                      ? AppColor.blue1
                      : AppColor.blue1.withOpacity(0.5),
                ))),
      ],
    );
  }
}
