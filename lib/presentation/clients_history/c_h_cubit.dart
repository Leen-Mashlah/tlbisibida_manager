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

//Load
  List<LabDetails> lablist = [];
  Future<void> labload() async {
    try {
      lablist = await repo.getHistoryLabs();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    lablist.isNotEmpty ? emit('labsloaded') : emit('error');
  }

  List<ClinicDetails> clilist = [];
  Future<void> cliload() async {
    try {
      clilist = await repo.getHistoryClinics();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    clilist.isNotEmpty ? emit('cliloaded') : emit('error');
  }

  //Renew
  Future<void> renew(int month, int id) async {
    bool status = false;
    try {
      status = await repo.renew(month, id);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    if (status) {
      emit('confirmed');
    } else {
      emit('error');
    }
  }
  // Future<void> labrenew(int month, int id) async {
  //   await repo.renewlabs(month, id);
  //   emit('labrenewed');
  // }
}
