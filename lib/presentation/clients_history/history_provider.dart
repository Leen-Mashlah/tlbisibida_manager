import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/data/repo/db_manager_repo.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';
import 'package:lambda_dent_dash/presentation/clients_history/c_h_cubit.dart';
import 'package:lambda_dent_dash/presentation/clients_history/clients_his_page.dart';
import 'package:lambda_dent_dash/services/navigation/controllers.dart';

class HistoryProvider extends StatelessWidget {
  HistoryProvider({super.key});

  final ManagerRepo repo = locator<DbManagerRepo>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HisCubit(repo),
      child: ClientsHistoryPage(),
    );
  }
}
