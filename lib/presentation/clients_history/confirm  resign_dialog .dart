import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/constant/components/default_button.dart';
import 'package:lambda_dent_dash/constant/components/default_textfield.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/presentation/clients_history/c_h_cubit.dart';

Dialog ConfirmResignDialog(BuildContext context, int id) {
  TextEditingController monthscontroller = TextEditingController();

  return Dialog(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: cyan200),
              borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 2.3,
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'تجديد الاشتراك',
                      style: TextStyle(
                          color: cyan400,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: .5,
                      width: 100,
                      color: cyan200,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('شهر'),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 150,
                          child:
                              defaultTextField(monthscontroller, context, ''),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('تجديد لمدة'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    defaultButton(
                        text: 'تم',
                        function: () {
                          context
                              .read<HisCubit>()
                              .renew(int.parse(monthscontroller.text), id);

                          Navigator.of(context).pop();
                        })
                  ],
                ),
              ),
            ),
          ])),
    ),
  );
}
