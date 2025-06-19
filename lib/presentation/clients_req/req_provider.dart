import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';
import 'package:lambda_dent_dash/presentation/clients_req/c_r_cubit.dart';
import 'package:lambda_dent_dash/presentation/clients_req/clients_req_page.dart';

class ReqProvider extends StatelessWidget {
  const ReqProvider({super.key, required this.repo});

  final ManagerRepo repo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReqCubit(repo),
      child: ClientsReqPage(),
    );
  }
}
