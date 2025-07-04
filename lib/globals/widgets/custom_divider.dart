import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double thickness;
  final double height;
  final Color color;

  const CustomDivider({
    super.key,
    this.thickness = 1,
    this.height = 0.5,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: thickness, height: height, color: color);
  }
}
