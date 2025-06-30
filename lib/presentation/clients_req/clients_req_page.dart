import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/presentation/clients_req/c_r_cubit.dart';

import 'package:lambda_dent_dash/presentation/clients_req/clients_doc_req_table.dart';
import 'package:lambda_dent_dash/presentation/clients_req/clients_lab_req_table.dart';

class ClientsReqPage extends StatelessWidget {
  ClientsReqPage({super.key});

  List choices = ['registered', 'requests'];
  final ValueNotifier<bool> _showregisteredlist = ValueNotifier<bool>(true);

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
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      width: 500,
                      child: InlineChoice<bool>.single(
                          value: _showregisteredlist.value,
                          onChanged: (value) {
                            value == null ? value = false : value = value;
                            _showregisteredlist.value = value;
                          },
                          clearable: false,
                          itemCount: choices.length,
                          itemBuilder: (state, i) {
                            return ChoiceChip(
                              selectedColor: cyan200,
                              side: const BorderSide(color: cyan300),
                              selected: state.selected(
                                  choices[i] == 'registered' ? true : false),
                              onSelected: state.onSelected(
                                  choices[i] == 'registered' ? true : false),
                              label: Text(choices[i] == 'registered'
                                  ? 'العيادات '
                                  : 'المخابر '),
                            );
                          },
                          listBuilder: ChoiceList.createWrapped(
                              runAlignment: WrapAlignment.center,
                              alignment: WrapAlignment.center,
                              direction: Axis.horizontal,
                              textDirection: TextDirection.rtl,
                              //spacing: 10,
                              //runSpacing: 10,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<ReqCubit, String>(
                    builder: (context, state) {
                      final currentReqCubit = context.read<ReqCubit>();

                      if (_showregisteredlist.value) {
                        // Showing clinics ('registered')
                        if (state == 'cliloaded' &&
                            currentReqCubit.clilist.isNotEmpty) {
                          return ClientsDocReqTable();
                        } else if (state == 'cliloaded' &&
                            currentReqCubit.clilist.isEmpty) {
                          return const Center(
                              child: Text("No registered clinics found."));
                        } else if (state == 'error') {
                          return const Center(
                              child: Text('Data Couldn\'t be loaded'));
                        } else {
                          // Still loading clinics
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      } else {
                        // Showing labs ('requests')
                        if (state == 'labsloaded' &&
                            currentReqCubit.lablist.isNotEmpty) {
                          return ClientsLabReqTable();
                        } else if (state == 'labsloaded' &&
                            currentReqCubit.lablist.isEmpty) {
                          return const Center(
                              child: Text("No lab requests found."));
                        } else if (state == 'error') {
                          return const Center(
                              child: Text('Data Couldn\'t be loaded'));
                        } else {
                          // Still loading labs
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
