import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
        AutoRouter.of(context).popUntilRouteWithName('BookingRoute');
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
              Text(
                  'GH¢${(widget.payload["costPerHour"] * widget.payload["duration"]).toString()}',
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(width: 5),
              Column(
                children: const [
                  SizedBox(height: 12),
                  Text(
                    '/h',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
          largeSpace,
          const Text('Purchase details:', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          SizedBox(
            height: sH * 0.15,
            child: ListView.builder(
              itemCount: widget.details.length,
              itemBuilder: (context, index) {
                return PurchaseTile(text: widget.details[index]);
              },
            ),
          )
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
  }) : super(key: key);
  final Function callback;

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
        AutoRouter.of(context).popUntilRouteWithName('BookingRoute');
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
          mediumSpace,
          TextField(
            controller: controller,
            onSubmitted: (value) {
              widget.callback(value);
            },
            maxLength: 10,
            keyboardType: TextInputType.number,
            cursorColor: Colors.black,
            decoration: InputDecoration(
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
  const PaymentPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    Widget mediumSpace = SizedBox(height: sH * 0.02);

    return WillPopScope(
      onWillPop: () async {
        AutoRouter.of(context).popUntilRouteWithName('BookingRoute');
        return false;
      },
      child: Column(
        children: [
          const Text(
            'Purchase Successful',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          mediumSpace,
          const Text('Here\'s your receipt')
        ],
      ),
    );
  }
}
