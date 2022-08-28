import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    required this.fieldController,
    required this.fieldName,
    required this.obscureText,
    required this.icon,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String fieldName;
  final bool obscureText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              height: 28,
              width: 10,
            ),
            Text(fieldName),
          ],
        ),
        TextFormField(
          obscureText: obscureText,
          controller: fieldController,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(0),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
          ),
        )
      ],
    );
  }
}
