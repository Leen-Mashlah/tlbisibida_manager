import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';

class AuthCubit extends Cubit<String> {
  final ManagerRepo repo;

  AuthCubit(this.repo) : super('') {}
}
