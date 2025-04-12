import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/view/payments/components/dialogs/add_constant_payment_dialog.dart';
import 'package:lambda_dent_dash/view/payments/components/payments_log_table.dart';

class PaymentsLogPage extends StatelessWidget {
  const PaymentsLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              PaymentsLogTable(),
            ],
          )),
          Positioned(
            bottom: 40,
            right: 45,
            child: Tooltip(
              // preferBelow: true,
              triggerMode: TooltipTriggerMode.longPress,
              message: 'إضافة مدفوعات ثابتة',
              verticalOffset: -30,
              textStyle: TextStyle(color: cyan500),
              margin: EdgeInsets.only(
                right: 110,
              ),
              decoration: BoxDecoration(
                  color: cyan50op,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.elliptical(53, 100),
                      right: Radius.elliptical(25, 40))),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              // height: 60,
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AddConstantPaymentDialog());
                },
                // child: FloatButton(
                //   icon: Icons.add,
                // ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
