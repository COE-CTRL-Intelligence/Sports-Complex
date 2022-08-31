import 'package:flutter/material.dart';

enum Gender { male, female }

class CustomRadioButton extends StatelessWidget {
  final Gender? groupValue;
  final Gender value;
  final Function(Gender?)? onChanged;
  final String title;
  const CustomRadioButton(
      {super.key,
      this.onChanged,
      required this.title,
      required this.value,
      this.groupValue});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<Gender>(
        contentPadding: const EdgeInsets.all(0),
        dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
