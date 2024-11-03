import 'package:flutter/material.dart';

class DecoratedWidget extends StatelessWidget {
  final double x;
  final double y;
  final Color color;
  final double height;
  final double width;
  final BoxShape shape;
  const DecoratedWidget({
    super.key,
    required this.x,
    required this.y,
    required this.height,
    required this.width,
    required this.color,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(x, y),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: shape,
          color: color,
        ),
      ),
    );
  }
}
