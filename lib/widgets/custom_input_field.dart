import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    required this.fieldController,
    required this.fieldName,
    required this.obscureText,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String fieldName;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(fieldName),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            obscureText: obscureText,
            controller: fieldController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}
