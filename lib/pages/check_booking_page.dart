import 'package:flutter/material.dart';
import '../widgets/custom_input_field.dart';

class CheckBookingPage extends StatelessWidget {
  const CheckBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookingCodeController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xffC2C3A0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const Text('CHECK BOOKING',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 150),
            CustomInputField(
                icon: const IconData(0),
                fieldName: "Enter Booking Code Here",
                fieldController: bookingCodeController,
                obscureText: false),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
