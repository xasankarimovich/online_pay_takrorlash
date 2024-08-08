import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height
        
      ),
    );
  }
}