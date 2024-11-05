import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
// import 'package:power_overload/Shared/constants.dart';

Widget datePicker(BuildContext context) {
  DateTime _dateTime = DateTime.now();
  void _showDatePicker() {
    showDatePicker(
      //barrierColor: green400,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    ).then((value) {
      value != null ? _dateTime = value : _dateTime = DateTime.now();
    });
  }

  return SizedBox(
    width: 200,
    child: Card(
      clipBehavior: Clip.antiAlias,
      color: cyan100,
      elevation: 1,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: cyan400, width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: _showDatePicker,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _dateTime.year.toString() +
                    '/' +
                    _dateTime.month.toString() +
                    '/' +
                    _dateTime.day.toString(),
                style: TextStyle(fontSize: 20),
              ),
              Icon(Icons.calendar_month_outlined),
            ],
          ),
        ),
      ),
    ),
  );
}
