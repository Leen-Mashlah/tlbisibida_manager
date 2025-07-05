// lib/presentation/clients_req/clients_req_page.dart
import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/presentation/clients_req/c_r_cubit.dart';

import 'package:lambda_dent_dash/presentation/clients_req/clients_doc_req_table.dart';
import 'package:lambda_dent_dash/presentation/clients_req/clients_lab_req_table.dart';

class ClientsReqPage extends StatelessWidget {
  ClientsReqPage({super.key});

  final ValueNotifier<bool> _showregisteredlist = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    // final ReqCubit reqCubit =
    //     context.read<ReqCubit>(); // Get the cubit to trigger loads

    return Scaffold(
      body: BlocConsumer<ReqCubit, String>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          ReqCubit reqCubit = context.read<ReqCubit>();
          return Padding(
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
                          child: ValueListenableBuilder<bool>(
                            valueListenable: _showregisteredlist,
                            builder: (context, isShowingRegistered, child) {
                              return InlineChoice<bool>.single(
                                value: isShowingRegistered,
                                onChanged: (value) {
                                  if (value != null) {
                                    _showregisteredlist.value = value;
                                    // Trigger a reload of the relevant data when switching tabs
                                    if (value) {
                                      reqCubit.cliload();
                                    } else {
                                      reqCubit.labload();
                                    }
                                  }
                                },
                                clearable: false,
                                itemCount: 2,
                                itemBuilder: (state, i) {
                                  final bool isRegisteredTab = i == 0;
                                  return ChoiceChip(
                                    selectedColor: cyan200,
                                    side: const BorderSide(color: cyan300),
                                    selected: state.selected(isRegisteredTab),
                                    onSelected:
                                        state.onSelected(isRegisteredTab),
                                    label: Text(isRegisteredTab
                                        ? 'العيادات '
                                        : 'المخابر '),
                                  );
                                },
                                listBuilder: ChoiceList.createWrapped(
                                  runAlignment: WrapAlignment.center,
                                  alignment: WrapAlignment.center,
                                  direction: Axis.horizontal,
                                  textDirection: TextDirection.rtl,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 5,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // This is the main content area that switches between tables
                      Center(
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _showregisteredlist,
                          builder: (context, isShowingRegistered, child) {
                            if (isShowingRegistered && state == 'cliloaded') {
                              return const ClientsDocReqTable();
                            } else if (!isShowingRegistered &&
                                state == 'labsloaded') {
                              return const ClientsLabReqTable();
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
