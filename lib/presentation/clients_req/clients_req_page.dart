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
    return Scaffold(
      body: BlocConsumer<ReqCubit, ReqState>(
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
                            // Handle different state types properly
                            if (state is ReqLoading) {
                              return const CircularProgressIndicator();
                            }

                            if (state is ReqError) {
                              return Text(
                                state.message,
                                style: const TextStyle(color: Colors.red),
                              );
                            }

                            if (state is ReqClinicsLoaded) {
                              if (isShowingRegistered) {
                                return const ClientsDocReqTable();
                              }
                            }

                            if (state is ReqLabsLoaded) {
                              if (!isShowingRegistered) {
                                return const ClientsLabReqTable();
                              }
                            }

                            if (state is ReqClinicsEmpty) {
                              if (isShowingRegistered) {
                                return const ClientsDocReqTable();
                              }
                            }

                            if (state is ReqLabsEmpty) {
                              if (!isShowingRegistered) {
                                return const ClientsLabReqTable();
                              }
                            }

                            if (state is ReqConfirming) {
                              return const CircularProgressIndicator();
                            }

                            if (state is ReqConfirmed) {
                              // Show the appropriate table after confirmation
                              if (state.isClinic) {
                                return const ClientsDocReqTable();
                              } else {
                                return const ClientsLabReqTable();
                              }
                            }

                            // Default loading state for initial or unexpected states
                            return const CircularProgressIndicator();
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
