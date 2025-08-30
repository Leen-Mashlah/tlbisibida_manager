import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lambda_dent_dash/constant/components/custom_text.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';

import 'c_l_cubit.dart';

/// Example without datasource
// ignore: must_be_immutable
class ClientsDocLogTable extends StatelessWidget {
  const ClientsDocLogTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogCubit, LogState>(
      builder: (context, state) {
        if (state is LogClinicsLoaded) {
          final clinics = state.clinics;
          if (clinics.isEmpty) {
            return const Center(
              child: Text('لا توجد عيادات مسجلة'),
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
                  height: (56 * clinics.length) + 40,
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
                      clinics.length,
                      (index) {
                        final clinic = clinics[index];
                        // Add null safety checks
                        if (clinic.fullName == null ||
                            clinic.address == null ||
                            clinic.phone == null ||
                            clinic.subscriptionFrom == null ||
                            clinic.subscriptionTo == null) {
                          return DataRow(
                            cells: List.generate(
                                5,
                                (cellIndex) => const DataCell(
                                    Center(child: Text('بيانات غير متوفرة')))),
                          );
                        }

                        return DataRow(
                          cells: [
                            DataCell(Center(
                                child: CustomText(
                              text: clinic.fullName!,
                            ))),
                            DataCell(Center(
                                child:
                                    CustomText(text: clinic.phone.toString()))),
                            DataCell(Center(
                                child: CustomText(text: clinic.address!))),
                            DataCell(Center(
                                child: CustomText(
                                    text: clinic.subscriptionFrom!))),
                            DataCell(Center(
                                child:
                                    CustomText(text: clinic.subscriptionTo!))),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ]),
            ),
          );
        } else if (state is LogClinicsEmpty) {
          return const Center(
            child: Text('لا توجد عيادات مسجلة'),
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
