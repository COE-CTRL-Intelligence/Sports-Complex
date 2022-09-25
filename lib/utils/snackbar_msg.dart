import 'package:flutter/material.dart';

// This is a custom Method that returns a snackBar with custom msg or default msg

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarMessage(
    String? msg, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black,
      content: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        msg != null
            ? Flexible(
                child: Text(
                  msg.startsWith('Failed host lookup')
                      ? 'No Internet Connection'
                      : msg,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            : const Text('Something went wrong, please try again later'),
      ])));
}
