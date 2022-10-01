import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sports_complex/utils/snackbar_msg.dart';
import 'package:sports_complex/widgets/payment_tile.dart';

// FIRST PAYMENT PAGE

class PaymentPage1 extends StatefulWidget {
  const PaymentPage1({Key? key, required this.payload, required this.details})
      : super(key: key);
  final Map<String, dynamic> payload;
  final List<String> details;

  @override
  State<PaymentPage1> createState() => _PaymentPage1State();
}

class _PaymentPage1State extends State<PaymentPage1> {
  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    Widget smallSpace = SizedBox(height: sH * 0.01);
    Widget mediumSpace = SizedBox(height: sH * 0.02);
    Widget largeSpace = SizedBox(height: sH * 0.04);
    Widget veryLargeSpace = SizedBox(height: sH * 0.3);

    return WillPopScope(
      onWillPop: () async {
        widget.details[2] == "b"
            ? AutoRouter.of(context).popUntilRouteWithName('BookingRoute')
            : AutoRouter.of(context).popUntilRouteWithName('GymDashboardRoute');
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          smallSpace,
          const Text(
            'Total',
            style: TextStyle(fontSize: 18),
          ),
          mediumSpace,
          Row(
            children: [
              widget.details[2] == "b"
                  ? Text(
                      'GH¢${(widget.payload["costPerHour"] * widget.payload["duration"]).toString()}',
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ))
                  : Text(
                      "GH¢${(widget.payload["price"])}",
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const SizedBox(width: 5),
              Column(
                children: [
                  const SizedBox(height: 12),
                  widget.details[2] == "b"
                      ? const Text(
                          '/h',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        )
                      : const Text("")
                ],
              )
            ],
          ),
          largeSpace,
          const Text('Purchase details:', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          SizedBox(
              width: double.maxFinite,
              height: sH * 0.15,
              child: widget.details[2] == "b"
                  ? ListView.builder(
                      itemCount: widget.details.length,
                      itemBuilder: (context, index) {
                        return PurchaseTile(text: widget.details[index]);
                      },
                    )
                  : ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return PurchaseTile(text: widget.details[index]);
                      },
                    ))
          // const PurchaseTile(text: 'Astro Turf Pitch'),
        ],
      ),
    );
  }
}

// SECOND PAYMENT PAGE

class PaymentPage2 extends StatefulWidget {
  const PaymentPage2({
    Key? key,
    required this.callback,
    required this.details,
  }) : super(key: key);
  final Function callback;
  final List<String> details;

  @override
  State<PaymentPage2> createState() => _PaymentPage2State();
}

class _PaymentPage2State extends State<PaymentPage2> {
  // Variables
  String? phoneNumber;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    Widget smallSpace = SizedBox(height: sH * 0.01);
    Widget mediumSpace = SizedBox(height: sH * 0.02);
    Widget largeSpace = SizedBox(height: sH * 0.04);
    Widget veryLargeSpace = SizedBox(height: sH * 0.3);

    return WillPopScope(
      onWillPop: () async {
        widget.details[2] == "b"
            ? AutoRouter.of(context).popUntilRouteWithName('BookingRoute')
            : AutoRouter.of(context).popUntilRouteWithName('GymDashboardRoute');
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Enter Momo Number',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          largeSpace,
          TextField(
            controller: controller,
            onChanged: (value) {
              widget.callback(value);
            },
            maxLength: 10,
            keyboardType: Platform.isIOS
                ? const TextInputType.numberWithOptions(
                    signed: true, decimal: true)
                : TextInputType.number,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: const Icon(Icons.phone),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}

// THIRD PAYMENT PAGE

class PaymentPage3 extends StatelessWidget {
  const PaymentPage3({Key? key, required this.payload, required this.details})
      : super(key: key);
  final Map<String, dynamic>? payload;
  final List<String> details;

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    Widget mediumSpace = SizedBox(height: sH * 0.02);

    return WillPopScope(
        onWillPop: () async {
          details[2] == "b"
              ? AutoRouter.of(context).popUntilRouteWithName('BookingRoute')
              : AutoRouter.of(context).popUntilRouteWithName('GymPageRoute');
          return false;
        },
        child: details[2] == "b"
            ? Column(
                children: [
                  const Text(
                    'Purchase Successful',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  mediumSpace,
                  const Text(
                    'Here\'s your receipt',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: sH * 0.13),
                  const Text('Tap to copy to clipboard',
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(payload!["bookingID"].toString().substring(0, 2),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.grey)),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: ([bool mounted = true]) async {
                          await Clipboard.setData(ClipboardData(
                              text: payload!["bookingID"]
                                  .toString()
                                  .substring(2)));
                          if (!mounted) return;
                          snackBarMessage('Copied to clipboard', context);
                        },
                        child: Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(
                                child: Text(
                                    payload!["bookingID"]
                                        .toString()
                                        .substring(2),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)))),
                      ),
                    ],
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "You Successfully Started the ${details[0]} plan, enjoy",
                    style: const TextStyle(fontSize: 30),
                  )
                ],
              ));
  }
}
