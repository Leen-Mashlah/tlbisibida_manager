import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lambda_dent_dash/constant/components/custom_text.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/presentation/clients_log/c_l_cubit.dart';

/// Example without datasource
// ignore: must_be_immutable
class ClientsLabLogTable extends StatelessWidget {
  const ClientsLabLogTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogCubit, LogState>(
      builder: (context, state) {
        if (state is LogLabsLoaded) {
          final labs = state.labs;
          if (labs.isEmpty) {
            return const Center(
              child: Text('لا توجد مخابر مسجلة'),
            );
          }

          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: cyan200, width: .5),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 6), color: Colors.grey, blurRadius: 12)
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: (56 * labs.length) + 40,
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
                          'اسم المخبر ',
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
                      labs.length,
                      (index) {
                        try {
                          final lab = labs[index];

                          // Add null safety checks
                          if (lab.labName == null ||
                              lab.labAddress == null ||
                              lab.labPhone == null ||
                              lab.labPhone!.isEmpty ||
                              lab.subscriptionFrom == null ||
                              lab.subscriptionTo == null) {
                            return DataRow(
                              cells: List.generate(
                                  5,
                                  (cellIndex) => const DataCell(Center(
                                      child: Text('بيانات غير متوفرة')))),
                            );
                          }

                          return DataRow(
                            cells: [
                              //name
                              DataCell(Center(
                                  child: CustomText(
                                text: lab.labName!,
                              ))),
                              //address
                              DataCell(Center(
                                  child: CustomText(text: lab.labAddress!))),
                              //num
                              DataCell(Center(
                                  child: CustomText(text: lab.labPhone![0]))),
                              //f date
                              DataCell(Center(
                                  child:
                                      CustomText(text: lab.subscriptionFrom!))),
                              //l date
                              DataCell(Center(
                                  child:
                                      CustomText(text: lab.subscriptionTo!))),
                            ],
                          );
                        } catch (e, stackTrace) {
                          print('Error processing lab at index $index: $e');
                          print('Stack trace: $stackTrace');
                          return DataRow(
                            cells: List.generate(
                                5,
                                (cellIndex) =>
                                    DataCell(Center(child: Text('خطأ: $e')))),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ]),
            ),
          );
        } else if (state is LogLabsEmpty) {
          return const Center(
            child: Text('لا توجد مخابر مسجلة'),
          );
        } else if (state is LogError) {
          return Center(
            child: Text(
              'خطأ: ${state.message}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        // Fallback for other states
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
