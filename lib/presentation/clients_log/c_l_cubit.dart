import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';

class LogCubit extends Cubit<String> {
  final ManagerRepo repo;

  LogCubit(this.repo) : super('') {
    cliload();
    labload();
  }

  //load
  List<LabDetails> lablist = [];
  Future<void> labload() async {
    try {
      lablist = await repo.getSubscribedLabs();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    lablist.isNotEmpty ? emit('labsloaded') : emit('error');
  }

  List<ClinicDetails> clilist = [];
  Future<void> cliload() async {
    try {
      clilist = await repo.getSubscribedClinics();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    clilist.isNotEmpty ? emit('cliloaded') : emit('error');
  }
}
