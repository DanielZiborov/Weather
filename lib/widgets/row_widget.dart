import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String image1;
  final String image2;
  final String text11;
  final String text12;
  final String text21;
  final String text22;
  const RowWidget({
    super.key,
    required this.image1,
    required this.image2,
    required this.text11,
    required this.text12,
    required this.text21,
    required this.text22,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Image.asset(image1, scale: 8),
            Column(
              children: [
                Text(
                  text11,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  text12,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(image2, scale: 8),
            Column(
              children: [
                Text(
                  text21,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  text22,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
