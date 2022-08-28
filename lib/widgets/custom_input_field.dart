import 'package:flutter/material.dart';

enum CustomInputType { email, password }

class CustomInputField extends StatefulWidget {
  final TextEditingController fieldController;
  final String fieldName;
  final IconData icon;
  final CustomInputType? type; // when null it builds an ordinary textfield,
  //  when email it builds a textfield with email validation and
  //builds a textfield with password validation when set to password

  const CustomInputField(
      {super.key,
      required this.fieldController,
      required this.fieldName,
      required this.icon,
      this.type});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  // Variables
  bool isVisible = true;

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
            Text(widget.fieldName),
          ],
        ),
        TextFormField(
          validator: widget.type == CustomInputType.email
              ? (value) => validateEmail(value)
              : null,
          obscureText:
              widget.type == CustomInputType.password ? isVisible : false,
          controller: widget.fieldController,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.type == CustomInputType.password
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: isVisible
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          )
                        : const Icon(Icons.visibility_off),
                  )
                : null,
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

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid email address';
  } else {
    return null;
  }
}
