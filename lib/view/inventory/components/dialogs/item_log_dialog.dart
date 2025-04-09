import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/components/default_button.dart';
import 'package:lambda_dent_dash/constant/components/default_textfield.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/view/inventory/components/item_log_table.dart';

Dialog itemLogDialog(BuildContext context) {
  return Dialog(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 1.3,
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                  child: ItemLogTable()),
            ),
          ])),
    ),
  );
}
