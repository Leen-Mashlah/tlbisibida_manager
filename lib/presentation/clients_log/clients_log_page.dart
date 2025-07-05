import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/presentation/clients_log/clients_doc_log_table.dart';
import 'package:lambda_dent_dash/presentation/clients_log/clients_lab_log_table.dart';
import 'package:lambda_dent_dash/presentation/clients_log/c_l_cubit.dart'; // Import your cubit

class ClientsLogPage extends StatelessWidget {
  ClientsLogPage({super.key});

  List choices = ['registered', 'requests'];
  final ValueNotifier<bool> _showregisteredlist = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LogCubit, String>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          LogCubit logCubit = context.read<LogCubit>();

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
                          child: InlineChoice<bool>.single(
                            value: _showregisteredlist.value,
                            onChanged: (value) {
                              if (value != null) {
                                _showregisteredlist.value = value;
                                // Trigger a reload of the relevant data when switching tabs
                                if (value) {
                                  logCubit.cliload();
                                } else {
                                  logCubit.labload();
                                }
                              }
                            },
                            clearable: false,
                            itemCount: choices.length,
                            itemBuilder: (state, i) {
                              final bool isRegisteredTab = i == 0;
                              return ChoiceChip(
                                selectedColor: cyan200,
                                side: const BorderSide(color: cyan300),
                                selected: state.selected(isRegisteredTab),
                                onSelected: state.onSelected(isRegisteredTab),
                                label: Text(
                                    isRegisteredTab ? 'العيادات ' : 'المخابر '),
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
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _showregisteredlist,
                          builder: (context, isShowingRegistered, child) {
                            if (isShowingRegistered && state == 'cliloaded') {
                              return const ClientsDocLogTable();
                            } else if (!isShowingRegistered &&
                                state == 'labsloaded') {
                              return const ClientsLabLogTable();
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
