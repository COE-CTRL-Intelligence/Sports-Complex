import 'package:flutter/material.dart';
import 'package:sports_complex/utils/colors.dart';

class PurchaseTile extends StatelessWidget {
  const PurchaseTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow_rounded,
            size: 30,
            color: AppColor.green1,
          ),
          const SizedBox(width: 15),
          Text(text, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
