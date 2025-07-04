import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/data/repo/db_manager_repo.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';
import 'package:lambda_dent_dash/presentation/clients_log/c_l_cubit.dart';
import 'package:lambda_dent_dash/services/navigation/controllers.dart';

import 'clients_log_page.dart';

class LogProvider extends StatelessWidget {
  LogProvider({super.key});

  final ManagerRepo repo = locator<DbManagerRepo>();
  // final StatelessWidget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogCubit(repo),
      child: ClientsLogPage(),
    );
  }
}
