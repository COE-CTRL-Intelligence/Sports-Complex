import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/routes/app_router.gr.dart';
import 'package:sports_complex/widgets/page_title.dart';
import 'package:sports_complex/widgets/side_bar.dart';
import '../widgets/custom_input_field.dart';

class CheckBookingPage extends StatelessWidget {
  const CheckBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookingCodeController = TextEditingController();

    return Scaffold(
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
              const PageTitle(title: 'CHECK BOOKING'),
              const SizedBox(height: 150),
              CustomInputField(
                icon: Icons.numbers,
                fieldName: "Enter Booking Code Here",
                fieldController: bookingCodeController,
              ),
              const SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {},
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
            ],
          ),
        )),
      ),
    );
  }
}
