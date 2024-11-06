import 'package:flutter/material.dart';
import 'package:lambda_dent_dash/constant/components/date_picker.dart';
import 'package:lambda_dent_dash/constant/components/default_button.dart';
import 'package:lambda_dent_dash/constant/components/default_textfield.dart';
import 'package:lambda_dent_dash/constant/components/float_button.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/view/bills/bills_table.dart';
import 'package:lambda_dent_dash/view/bills/components/add_bill_dialog.dart';
import 'package:lambda_dent_dash/view/cases/case_details_table.dart';
import 'package:lambda_dent_dash/view/clients/clients_table.dart';

class CaseDetails extends StatelessWidget {
  CaseDetails({super.key});
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 400,
                  height: 700,
                  decoration: BoxDecoration(
                      color: cyan300,
                      border: Border.all(color: cyan300, width: .5),
                      borderRadius: BorderRadius.circular(50)),
                  child: CaseDetailsTable(),
                ),
                Container(
                  width: 400,
                  height: 700,
                  decoration: BoxDecoration(
                      color: cyan300,
                      border: Border.all(color: cyan300, width: .5),
                      borderRadius: BorderRadius.circular(50)),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: white,
                      border: Border.all(color: cyan500, width: .5),
                      borderRadius: BorderRadius.circular(50)),
                  width: 400,
                  height: 700,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'اسم الزبون',
                          style: TextStyle(color: cyan600, fontSize: 16),
                        ),
                        Text('تحسين التحسيني'),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: .3,
                          color: cyan300,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'اسم المريض',
                          style: TextStyle(color: cyan600, fontSize: 16),
                        ),
                        Text('تحسين التحسيني'),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: .3,
                          color: cyan300,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'العمر',
                                  style:
                                      TextStyle(color: cyan600, fontSize: 16),
                                ),
                                Text('11'),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Container(
                              height: 25,
                              width: .5,
                              color: cyan400,
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Column(
                              children: [
                                Text(
                                  'الجنس',
                                  style:
                                      TextStyle(color: cyan600, fontSize: 16),
                                ),
                                Text('أنثى'),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: .3,
                          color: cyan300,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'اللون',
                          style: TextStyle(color: cyan600, fontSize: 16),
                        ),
                        Text('B2'),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: .3,
                          color: cyan300,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'تاريخ الإنشاء',
                          style: TextStyle(color: cyan600, fontSize: 16),
                        ),
                        Text('6/10/2024'),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: .3,
                          color: cyan300,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'تاريخ التوصيل',
                          style: TextStyle(color: cyan600, fontSize: 16),
                        ),
                        Text('6/10/2024'),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: .3,
                          color: cyan300,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'تحتاج إلى إعادة',
                                  style:
                                      TextStyle(color: cyan600, fontSize: 16),
                                ),
                                Text('لا'),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Container(
                              height: 25,
                              width: .5,
                              color: cyan400,
                            ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            Column(
                              children: [
                                Text(
                                  'تحتاج إلى تجربة',
                                  style:
                                      TextStyle(color: cyan600, fontSize: 16),
                                ),
                                Text('نعم'),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: .3,
                          color: cyan300,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'الملاحظات',
                          style: TextStyle(color: cyan600, fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: cyan300, width: .3),
                              borderRadius: BorderRadius.circular(20)),
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'تىتى لااتنا الااالا انم قيقي صغقه يقخميغف غفبفغي غفبغفبف فغبغفبف غفبفب فبفغب هعلالا 44 ممغع برفالؤ غبفبفب عغنلا '),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: .3,
                          color: cyan300,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'التعليقات',
                          style: TextStyle(color: cyan600, fontSize: 16),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: cyan300, width: .3),
                              borderRadius: BorderRadius.circular(20)),
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'تىتى لااتنا الااالا انم قيقي صغقه يقخميغف غفبفغي غفبغفبف فغبغفبف غفبفب فبفغب هعلالا 44 ممغع برفالؤ غبفبفب عغنلا '),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                color: cyan300),
          ),
        ],
      ),
    ));
  }
}
