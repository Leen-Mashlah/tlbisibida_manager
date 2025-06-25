import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lambda_dent_dash/constant/components/custom_text.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';

import 'c_l_cubit.dart';

/// Example without datasource
// ignore: must_be_immutable
class ClientsDocLogTable extends StatelessWidget {
  const ClientsDocLogTable(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LogCubit>();

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
                    'اسم الطبيب ',
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
                    'العنوان',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'تاريخ بداية الاشتراك ',
                    style: TextStyle(color: cyan300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    ' تاريخ نهاية الاشتراك',
                    style: TextStyle(color: cyan300),
                  )),
                ),
              ],
              rows: List<DataRow>.generate(
                cubit.clilist.length,
                (index) => DataRow(
                  cells: [
                    DataCell(Center(
                        child: CustomText(
                      text: cubit.clilist[index].fullName!,
                    ))),
                    DataCell(Center(
                        child:
                            CustomText(text: cubit.clilist[index].address!))),
                    DataCell(Center(
                        child: CustomText(
                            text: cubit.clilist[index].phone.toString()))),
                    DataCell(Center(
                        child: CustomText(
                            text: cubit.clilist[index].subscriptionFrom!))),
                    DataCell(Center(
                        child: CustomText(
                            text: cubit.clilist[index].subscriptionTo!))),
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
