import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sports_complex/pages/payment_subpages.dart';
import 'package:sports_complex/utils/colors.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});
  final CarouselController carouselController = CarouselController();

  void nextPage() {
    carouselController.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.cream1,
        body: Builder(
          builder: (context) {
            return CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                enableInfiniteScroll: false,
                autoPlay: false,
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.0,
              ),
              items: [
                PaymentPage1(carouselController: carouselController),
                PaymentPage2(carouselController: carouselController),
              ],
            );
          },
        ),
      ),
    );
  }
}
