import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';

class HisCubit extends Cubit<String> {
  final ManagerRepo repo;

  HisCubit(this.repo) : super('') {
    cliload();
    labload();
  }

  //load
  List<LabDetails> lablist = [];
  Future<void> labload() async {
    lablist = await repo.getHistoryLabs();
    emit('labsloaded');
  }

  List<ClinicDetails> clilist = [];
  Future<void> cliload() async {
    clilist = await repo.getHistoryClinics();
    emit('cliloaded');
  }

  //Renew
  Future<void> renew(int month, int id) async {
    await repo.renew(month, id);
    emit('clirenewed');
  }

  // Future<void> labrenew(int month, int id) async {
  //   await repo.renewlabs(month, id);
  //   emit('labrenewed');
  // }
}
