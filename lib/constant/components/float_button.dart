import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
// import 'package:power_overload/Shared/constants.dart';

Widget FloatButton({VoidCallback? onTap, IconData? icon,Color? color}) {
  return Container(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 52.0,
        height: 52.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Icon(
          icon,
          color: cyan400,
          size: 25.0,
        ),
      ),
    ),
  );
}
