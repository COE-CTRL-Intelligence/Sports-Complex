import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/payment_subpages.dart';
import 'package:sports_complex/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:sports_complex/utils/constants.dart';
import 'package:sports_complex/utils/snackbar_msg.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.payload, required this.details});
  final Map<String, dynamic> payload;
  final List<String> details;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final CarouselController carouselController = CarouselController();
  List<int> imgList = [0, 1, 2];
  int _current = 0;
  String? phoneNumber;

  // Methods
  void setPhoneNumber(String number) {
    setState(() {
      phoneNumber = number;
    });
  }

  void placeBooking() async {
    debugPrint(phoneNumber);
    try {
      var response = await http.post(Uri.parse('$baseURL/bookings'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "platformID": widget.payload["_id"],
            "startTime": widget.payload["startTime"].toString(),
            "endTime": widget.payload["endTime"].toString(),
            "duration": widget.payload["duration"],
            "number": phoneNumber
          }));

      var jsonData = jsonDecode(response.body);
      debugPrint(jsonData.toString());
      if (response.statusCode == 201) {
        debugPrint('Created');
      } else {
        if (!mounted) return;
        snackBarMessage('Payment Failed', context);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Function> functionList = [
      carouselController.nextPage,
      placeBooking,
      Navigator.of(context).pop
    ];
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.cream1,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                children: [
                  // SizedBox(height: sH * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: sH * 0.1),
                  Builder(
                    builder: (context) {
                      return CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                          scrollPhysics: const NeverScrollableScrollPhysics(),
                          enableInfiniteScroll: false,
                          autoPlay: false,
                          height: sH * 0.6,
                          viewportFraction: 1,
                        ),
                        items: [
                          PaymentPage1(
                            payload: widget.payload,
                            details: widget.details,
                          ),
                          PaymentPage2(callback: setPhoneNumber),
                          const PaymentPage3()
                        ],
                      );
                    },
                  ),
                  SizedBox(height: sH * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: sW * 0.35, height: sH * 0.07),
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () {
                            AutoRouter.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: sW * 0.35, height: sH * 0.07),
                        child: ElevatedButton(
                          onPressed: () {
                            functionList[_current]();
                          },
                          child: const Text('Proceed'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
