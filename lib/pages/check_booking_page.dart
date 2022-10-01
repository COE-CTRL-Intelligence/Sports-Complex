import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/utils/constants.dart';
import 'package:sports_complex/utils/snackbar_msg.dart';
import 'package:sports_complex/widgets/page_title.dart';
import 'package:sports_complex/widgets/side_bar.dart';
import '../widgets/custom_input_field.dart';
import 'package:http/http.dart' as http;

import '../widgets/sportify_logo.dart';

class CheckBookingPage extends StatefulWidget {
  const CheckBookingPage({Key? key}) : super(key: key);

  @override
  State<CheckBookingPage> createState() => _CheckBookingPageState();
}

class _CheckBookingPageState extends State<CheckBookingPage> {
  final bookingCodeController = TextEditingController();
  bool isVisible = true;
  Map<String, dynamic>? bookDetails;

  void onSubmit() async {
    if (bookingCodeController.text.isNotEmpty) {
      try {
        toggleLoad();
        var response =
            await http.post(Uri.parse('$baseURL/bookings/checkBooking'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, dynamic>{
                  "bookingID": 'B-${bookingCodeController.text}',
                }));

        var jsonData = jsonDecode(response.body);
        debugPrint(jsonData.toString());
        if (response.statusCode == 200) {
          toggleLoad();
          setState(() {
            bookDetails = jsonData;
          });
        } else {
          toggleLoad();
          setState(() {
            bookDetails = null;
          });
          if (!mounted) return;
          snackBarMessage(jsonData.toString(), context);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void toggleLoad() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        AutoRouter.of(context).navigate(const HomeRoute());
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffC2C3A0),
        endDrawer: const Sidebar(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(const HomeRoute());
              },
              child: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const Hero(
                  tag: 'sportify_logo',
                  child: Center(
                    child: SportifyLogo(logoSize: 45),
                  ),
                ),
                //const PageTitle(title: 'CHECK BOOKING'),
                SizedBox(height: bookDetails == null ? sH * 0.15 : sH * 0.10),
                CustomInputField(
                  optionalFunction: onSubmit,
                  icon: Icons.numbers,
                  fieldName: "Enter Booking Code Here",
                  fieldController: bookingCodeController,
                ),
                SizedBox(height: sH * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Visibility(
                    visible: isVisible,
                    replacement: const CircularProgressIndicator(),
                    child: SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            onSubmit();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              primary: const Color(0xff83D475)),
                          child: const Text(
                            "Check Booking",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: sH * 0.13),
                bookDetails != null
                    ? Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            DetailTile(
                                title: 'Platform',
                                value: bookDetails!["platformName"]),
                            DetailTile(
                                title: 'Date',
                                value: DateFormat('d MMM y').format(
                                    DateTime.parse(bookDetails!["startTime"]))),
                            DetailTile(
                                title: 'Time',
                                value: DateFormat.jm().format(
                                    DateTime.parse(bookDetails!["startTime"]))),
                            DetailTile(
                                title: 'Duration',
                                value:
                                    "${bookDetails!["duration"]} ${bookDetails!["duration"] > 1 ? 'hrs' : 'hr'}")
                          ],
                        ))
                    : const SizedBox()
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class DetailTile extends StatelessWidget {
  const DetailTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$title:',
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.black)),
          const SizedBox(width: 10),
          Text(value,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black))
        ],
      ),
    );
  }
}
