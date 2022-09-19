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
              fontSize: 25,
              color: AppColor.headerColor,
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
          DateTime? newDate = DateTime(
            selectedTime!.year,
            selectedTime!.month,
            selectedTime!.day,
            time!.hour,
            time.minute,
          );
          updateTime(newDate, 'TIME');
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
          decoration: BoxDecoration(
              color: AppColor.customWidgetBG,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          alignment: Alignment.center,
          height: 50,
          child: Text(DateFormat.jm().format(selectedTime!),
              style: TextStyle(color: AppColor.headerColor, fontSize: 20))),
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
    return Expanded(
      child: GestureDetector(
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
            decoration: BoxDecoration(
                color: AppColor.customWidgetBG,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            alignment: Alignment.center,
            height: 50,
            child: Text(DateFormat('d MMM y').format(selectedDate!),
                style: TextStyle(color: AppColor.headerColor, fontSize: 20))),
      ),
    );
  }
}
