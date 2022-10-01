import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/models/booking.dart';
import 'package:sports_complex/pages/payment_subpages.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
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
  int _current = 0;
  String? phoneNumber;
  bool progressClicked = false;
  Map<String, dynamic>? bookRes;
  Map<String, dynamic>? subsRes;

  // Methods
  void setPhoneNumber(String number) {
    setState(() {
      phoneNumber = number;
    });
  }

  void placeService() async {
    showCircularProgressLoading();
    //--------------------------------------------------------------for booking
    if (widget.details[2] == "b") {
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
        if (response.statusCode == 201) {
          showMyDialog('Payment Successful!', carouselController.nextPage);
          setState(() {
            bookRes = jsonData;
          });
        } else {
          showMyDialog(jsonData.toString(), null);
          
        }
      } catch (e) {
        debugPrint(e.toString());
      }
      //--------------------------------------------------------for subscriptons
    } else if (widget.details[2] == "a") {
      try {
        debugPrint(widget.details[3]);
        var response = await http.post(Uri.parse('$baseURL/subscriptions'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              "planID": widget.payload["_id"],
              "userID": widget.details[3],
              "number": phoneNumber
            }));

        var jsonData = jsonDecode(response.body);
        if (response.statusCode == 201) {
          showMyDialog('Payment Successful!', carouselController.nextPage);
          setState(() {
            subsRes = jsonData;
          });
        } else {
          showMyDialog(jsonData.toString(), null);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
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
            strokeWidth: 4,
          ),
        );
      },
      context: context,
    );
  }

  void closePayment() {
    if (widget.details[2] == "b") {
      Booking newAppointment = Booking(
        platformId: widget.payload["_id"],
        startTime: widget.payload["startTime"],
        endTime: widget.payload["endTime"],
      );

      AutoRouter.of(context).push(BookingRoute(
          title: widget.payload["name"],
          id: widget.payload["_id"],
          appointment: newAppointment));
    } else if (widget.details[2] == "a") {
      //what you would do when closing payment for subscription
      AutoRouter.of(context).push(const GymDashboardRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Function> functionList = [
      carouselController.nextPage,
      placeService,
      closePayment,
    ];
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.cream1,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [0, 1, 2].asMap().entries.map((entry) {
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Colors.green)
                              .withOpacity(_current >= entry.key ? 0.9 : 0.4)),
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
                          details: widget.details,
                          callback: setPhoneNumber,
                        ),
                        widget.details[2] == "b"
                            ? PaymentPage3(
                                payload: bookRes, details: widget.details)
                            : PaymentPage3(
                                payload: subsRes, details: widget.details)
                      ],
                    );
                  },
                ),
                SizedBox(height: sH * 0.05),
                Row(
                  mainAxisAlignment: _current != 2
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    _current != 2
                        ? ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                width: sW * 0.35, height: sH * 0.07),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () {
                                widget.details[2] == "b"
                                    ? AutoRouter.of(context)
                                        .popUntilRouteWithName('BookingRoute')
                                    : AutoRouter.of(context)
                                        .popUntilRouteWithName(
                                            'GymDashboardRoute');
                              },
                              child: const Text('Cancel'),
                            ),
                          )
                        : const SizedBox(),
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
                          } else {
                            null;
                          }
                        },
                        child: Text(['Confirm', 'Proceed', 'Finish'][_current]
                            .toString()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
