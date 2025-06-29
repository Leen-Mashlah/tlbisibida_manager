import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:lambda_dent_dash/constant/constants/constants.dart';
import 'package:lambda_dent_dash/presentation/clients_log/clients_doc_log_table.dart';
import 'package:lambda_dent_dash/presentation/clients_log/clients_lab_log_table%20copy.dart';
import 'package:lambda_dent_dash/presentation/clients_log/c_l_cubit.dart'; // Import your cubit

class ClientsLogPage extends StatelessWidget {
  ClientsLogPage({super.key});

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
                  // Use BlocBuilder here to react to Cubit state changes
                  BlocBuilder<LogCubit, String>(
                    builder: (context, state) {
                      // Access the cubit HERE. This 'context' is now a descendant
                      // of the BlocProvider.
                      final currentLogCubit = context.read<LogCubit>();

                      // Determine what to show based on the selected choice and data loading state
                      if (_showregisteredlist.value) {
                        // Showing clinics ('registered')
                        if (state == 'cliloaded' &&
                            currentLogCubit.clilist.isNotEmpty) {
                          return const ClientsDocLogTable();
                        } else if (state == 'cliloaded' &&
                            currentLogCubit.clilist.isEmpty) {
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
                            currentLogCubit.lablist.isNotEmpty) {
                          return ClientsLabLogTable();
                        } else if (state == 'labsloaded' &&
                            currentLogCubit.lablist.isEmpty) {
                          return const Center(
                              child: Text("No lab requests found."));
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
