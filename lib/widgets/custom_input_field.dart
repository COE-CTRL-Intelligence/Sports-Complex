import 'package:flutter/material.dart';

enum CustomInputType { email, password }

class CustomInputField extends StatefulWidget {
  final TextEditingController fieldController;
  final TextEditingController? twinFieldController;
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
      this.type,
      this.twinFieldController});

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
              ? (value) => validateEmail(value, widget.fieldController)
              : widget.type == CustomInputType.password
                  ? (value) => validatePassword(
                      value, widget.fieldController, widget.twinFieldController)
                  : (value) => validateField(value, widget.fieldName),
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

String? validateEmail(String? value, TextEditingController controller) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    controller.clear();
    return 'Enter a valid email address';
  } else {
    return null;
  }
}

String? validatePassword(String? value, TextEditingController controller,
    TextEditingController? twinController) {
  if (value == null || value.isEmpty && twinController != null) {
    return 'Password cannot be empty';
  } else if (twinController != null && value != twinController.text) {
    controller.clear();
    twinController.clear();
    return 'Passwords don\'t match';
  } else if (value.length < 6) {
    controller.clear();
    return 'Password too short';
  } else {
    return null;
  }
}

String? validateField(String? value, String? fieldName) {
  if (value == null || value.isEmpty) {
    return '$fieldName cannot be empty';
  } else {
    return null;
  }
}
