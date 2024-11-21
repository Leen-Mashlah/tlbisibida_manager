import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/components/date_picker.dart';
import 'package:lambda_dent_dash/constant/components/default_button.dart';
import 'package:lambda_dent_dash/constant/components/default_textfield.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';

class AddConstantPaymentDialog extends StatelessWidget {
  AddConstantPaymentDialog({
    super.key,
  });
  TextEditingController title_controller = new TextEditingController();
  TextEditingController cost_controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'إضافة مدفوعات ثابتة',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  child: Container(
                    width: 600,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: cyan200,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultTextField(
                                title_controller, context, 'عنوان المدفوعات'),
                            SizedBox(
                              height: 20,
                            ),
                            defaultTextField(
                                cost_controller, context, 'القيمة المدفوعة'),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            datePicker(context),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'تاريخ الدفع',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                defaultButton(
                    text: 'إرسال',
                    function: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
