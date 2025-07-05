import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? alignment;

  const CustomText(
      {super.key,
      required this.text,
      this.size,
      this.color,
      this.weight,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black87,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}
