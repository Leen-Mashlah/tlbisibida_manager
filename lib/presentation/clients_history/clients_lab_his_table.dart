import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/constant/components/custom_text.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/presentation/clients_history/c_h_cubit.dart';
import 'package:lambda_dent_dash/presentation/clients_history/confirm_register_dialog.dart';

/// Example without datasource
// ignore: must_be_immutable
class ClientsLabHisTable extends StatelessWidget {
  const ClientsLabHisTable({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HisCubit>();
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: cyan200, width: .5),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 6), color: Colors.grey, blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 30),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: (56 * 50) + 40,
            child: DataTable2(
              columnSpacing: 12,
              dataRowHeight: 56,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn(
                  label: Center(
                      child: Text(
                    ' تجديد الاشتراك',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                // DataColumn(
                //   label: Center(
                //       child: Text(
                //     'المدة',
                //     style: TextStyle(color: cyan300),
                //   )),
                // ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'تاريخ نهاية الاشتراك ',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'العنوان',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'رقم الهاتف',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'اسم المخبر ',
                    style: TextStyle(color: cyan300),
                  )),
                ),
              ],
              rows: List<DataRow>.generate(
                cubit.lablist.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Center(
                        child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ConfirmRegisterDialog(
                            context,
                            cubit.lablist[index].subscriptionId!,
                          ),
                        );
                      },
                      icon: const Icon(
                        CupertinoIcons.checkmark_seal,
                        color: cyan300,
                      ),
                    ))),
                    //date
                    DataCell(Center(
                        child: CustomText(
                            text: cubit.lablist[index].subscriptionTo!))),
                    //city
                    DataCell(Center(
                        child: CustomText(
                            text: cubit.lablist[index].labAddress!))),
                    //number
                    DataCell(Center(
                        child: CustomText(
                            text: cubit.lablist[index].labPhone![0]))),
                    //name
                    DataCell(Center(
                        child: CustomText(
                      text: cubit.lablist[index].labName!,
                    ))),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
