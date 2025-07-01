import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/data/repo/db_manager_repo.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';
import 'package:lambda_dent_dash/presentation/authentication/authentication_page.dart';
import 'package:lambda_dent_dash/services/navigation/controllers.dart';

import 'auth_cubit.dart';

class AuthenticationProvider extends StatelessWidget {
  AuthenticationProvider({super.key});

  final ManagerRepo repo = locator<DbManagerRepo>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(repo),
      child: AuthenticationPage(),
    );
  }
}
