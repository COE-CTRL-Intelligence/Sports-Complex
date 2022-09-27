import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/utils/colors.dart';
import 'package:sports_complex/widgets/payment_tile.dart';

// FIRST PAYMENT PAGE

class PaymentPage1 extends StatelessWidget {
  const PaymentPage1({Key? key, required this.carouselController})
      : super(key: key);
  final CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    Widget smallSpace = SizedBox(height: sH * 0.01);
    Widget mediumSpace = SizedBox(height: sH * 0.02);
    Widget largeSpace = SizedBox(height: sH * 0.04);
    Widget veryLargeSpace = SizedBox(height: sH * 0.3);

    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                  const Text('GH¢179',
                      style: TextStyle(
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
              const PurchaseTile(text: 'Astro Turf Pitch'),
              const PurchaseTile(text: '3 hours'),
              veryLargeSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: sW * 0.35, height: sH * 0.07),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
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
                        carouselController.nextPage();
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
    );
  }
}

// SECOND PAYMENT PAGE

class PaymentPage2 extends StatelessWidget {
  const PaymentPage2({Key? key, required this.carouselController})
      : super(key: key);
  final CarouselController carouselController;

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    Widget smallSpace = SizedBox(height: sH * 0.01);
    Widget mediumSpace = SizedBox(height: sH * 0.02);
    Widget largeSpace = SizedBox(height: sH * 0.04);

    return WillPopScope(
      onWillPop: () async {
        await carouselController.previousPage();
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
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
            // const PurchaseTile(text: '3 hours'),
          ],
        ),
      ),
    );
  }
}
