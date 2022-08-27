import 'package:flutter/material.dart';

class CustomSignUpInputField extends StatelessWidget {
  const CustomSignUpInputField(
      {Key? key,
      required this.fieldController,
      required this.fieldName,
      required this.obscureText,
      required this.icon})
      : super(key: key);

  final TextEditingController fieldController;
  final String fieldName;
  final bool obscureText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
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
              prefixIcon: Icon(
                icon,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
