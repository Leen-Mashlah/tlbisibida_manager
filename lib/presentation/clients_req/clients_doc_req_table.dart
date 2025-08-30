import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lambda_dent_dash/constant/components/custom_text.dart';
import 'package:lambda_dent_dash/constant/components/default_button.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/presentation/clients_req/c_r_cubit.dart';

/// Example without datasource
// ignore: must_be_immutable
class ClientsDocReqTable extends StatelessWidget {
  const ClientsDocReqTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReqCubit, ReqState>(
      builder: (context, state) {
        if (state is ReqClinicsLoaded) {
          final clinics = state.clinics;
          if (clinics.isEmpty) {
            return const Center(
              child: Text('لا توجد عيادات في انتظار التأكيد'),
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
                          'اسم الطبيب',
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
                          'تاريخ الطلب ',
                          style: TextStyle(color: cyan300),
                        )),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text(
                          'المدة',
                          style: TextStyle(color: cyan300),
                        )),
                      ),
                      DataColumn(
                        label: Center(
                            child: Text(
                          'تأكيد الطلب',
                          style: TextStyle(color: cyan300),
                        )),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      clinics.length,
                      (index) {
                        final clinic = clinics[index];
                        // Add null safety checks
                        // if (clinic.id == null ||
                        //     clinic.fullName == null ||
                        //     clinic.address == null ||
                        //     clinic.phone == null ||
                        //     clinic.registerDate == null ||
                        //     clinic.duration == null) {
                        //   return DataRow(
                        //     cells: List.generate(
                        //         6,
                        //         (cellIndex) => const DataCell(
                        //             Center(child: Text('بيانات غير متوفرة')))),
                        //   );
                        // }

                        return DataRow(
                          cells: [
                            //name
                            DataCell(Center(
                                child: CustomText(
                              text: clinic.fullName!,
                            ))),
                            //add
                            DataCell(Center(
                                child: CustomText(text: clinic.address!))),
                            //num
                            DataCell(Center(
                                child:
                                    CustomText(text: clinic.phone.toString()))),
                            //date
                            DataCell(Center(
                                child: CustomText(text: clinic.registerDate!))),
                            //mddi
                            DataCell(Center(
                                child: CustomText(
                                    text: clinic.duration.toString()))),
                            DataCell(Center(
                                child: IconButton(
                              onPressed: () {
                                final cubit = context.read<ReqCubit>();
                                cubit.cliconfirm(clinic.id!);
                                cubit.cliload();
                                // showDialog(
                                //   context: context,
                                //   builder: (context) =>
                                //       BlocBuilder<ReqCubit, ReqState>(
                                //     builder: (context, dialogState) {
                                //       return Dialog(
                                //         child: SizedBox(
                                //           height: 200,
                                //           child: Column(
                                //             children: [
                                //               dialogState is ReqConfirmed &&
                                //                       dialogState.isClinic
                                //                   ? const Text(
                                //                       'تم القبول بنجاح')
                                //                   : const Text(
                                //                       'حدث خطأ،لم تتم عملية القبول '),
                                //               const SizedBox(
                                //                 height: 5,
                                //               ),
                                //               defaultButton(
                                //                   text: 'تم',
                                //                   function: () {
                                //                     Navigator.of(context).pop();
                                //                   }),
                                //             ],
                                //           ),
                                //         ),
                                //       );
                                //     },
                                //   ),
                                // );
                              },
                              icon: const Icon(
                                CupertinoIcons.checkmark_seal,
                                color: cyan300,
                              ),
                            ))),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ]),
            ),
          );
        } else if (state is ReqClinicsEmpty) {
          return const Center(
            child: Text('لا توجد عيادات في انتظار التأكيد'),
          );
        } else if (state is ReqError) {
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
