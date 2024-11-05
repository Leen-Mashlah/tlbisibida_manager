import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/components/date_picker.dart';
import 'package:lambda_dent_dash/constant/components/default_button.dart';
import 'package:lambda_dent_dash/constant/components/default_textfield.dart';
import 'package:lambda_dent_dash/constant/components/float_button.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/view/bills/bills_table.dart';
import 'package:lambda_dent_dash/view/bills/components/add_bill_dialog.dart';
import 'package:lambda_dent_dash/view/clients/clients_table.dart';

class BillsPage extends StatelessWidget {
  BillsPage({super.key});
  TextEditingController _controller = new TextEditingController();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    child: defaultTextField(_controller, context, 'بحث',
                        postfixicon: Icon(Icons.search_rounded)),
                    height: 40,
                    width: 200,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  DropdownButton(
                    icon: Icon(Icons.sort),
                    hint: Text("الترتيب حسب"),
                    items: [
                      DropdownMenuItem(value: 'BL1', child: Text('اسم الزبون')),
                      DropdownMenuItem(
                          value: 'BL2', child: Text('رقم الفاتورة')),
                      DropdownMenuItem(value: 'BL3', child: Text('التاريخ')),
                    ],
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BillsTable(),
            ],
          )),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatButton(
              icon: Icons.add,
              onTap: () {
                showDialog(
                    context: context, builder: (context) => AddBillDialog());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
