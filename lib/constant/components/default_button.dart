import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';

// import 'package:power_overload/Shared/constants.dart';
Widget defaultButton({
  double width = 150,
  required String text,
  required VoidCallback function,
  ValueChanged<bool>? hoverfunction,
  double heigh = 60,
  double? textsize,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[cyan400, cyan300, cyan100]),
    ),
    width: width,
    height: heigh,
    child: TextButton(
      onPressed: function,
      onHover: hoverfunction,
      child: Text(
        text,
        style: TextStyle(fontSize: textsize),
      ),
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: StandardBorderRadius,
            //  side: BorderSide(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

Widget redButton({
  double width = 150,
  required String text,
  required VoidCallback function,
  double heigh = 60,
  double? textsize,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[redmain, redmid, redbackground]),
    ),
    width: width,
    height: heigh,
    child: TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(fontSize: textsize),
      ),
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: StandardBorderRadius,
            //  side: BorderSide(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
