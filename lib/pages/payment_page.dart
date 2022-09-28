import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/payment_subpages.dart';
import 'package:sports_complex/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:sports_complex/utils/constants.dart';

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
  bool progressClicked = false;
  Timer? timer;

  // Methods
  void setPhoneNumber(String number) {
    setState(() {
      phoneNumber = number;
    });
  }

  void placeBooking() async {
    showCircularProgressLoading();
    // debugPrint(phoneNumber);
    // debugPrint(widget.payload["startTime"].toString());
    // debugPrint(widget.payload["endTime"].toString());
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
        showMyDialog('Payment Successful!', carouselController.nextPage);
      } else {
        showMyDialog('Payment Failed', null);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void delayProgressButton() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        progressClicked = false;
      });
    });
  }

  Future<void> showMyDialog(String dataString, Function? function) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Message'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(dataString)],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                function != null ? function() : null;
              },
            ),
          ],
        );
      },
    );
  }

  void showCircularProgressLoading() {
    showDialog(
      barrierDismissible: false,
      builder: (ctx) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        );
      },
      context: context,
    );
  }

  void closePayment() {
    AutoRouter.of(context).popUntilRouteWithName('BookingRoute');
  }

  @override
  Widget build(BuildContext context) {
    List<Function> functionList = [
      carouselController.nextPage,
      placeBooking,
      closePayment,
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
                          PaymentPage2(
                            callback: setPhoneNumber,
                          ),
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
                            AutoRouter.of(context)
                                .popUntilRouteWithName('BookingRoute');
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.tightFor(
                            width: sW * 0.35, height: sH * 0.07),
                        child: ElevatedButton(
                          onPressed: () {
                            if (progressClicked == false) {
                              functionList[_current]();
                              setState(() {
                                progressClicked = false;
                              });
                              delayProgressButton();
                            } else {
                              null;
                            }
                          },
                          child: const Text('Proceed'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
