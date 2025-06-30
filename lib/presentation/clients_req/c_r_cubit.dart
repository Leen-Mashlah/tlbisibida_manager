import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';

class ReqCubit extends Cubit<String> {
  final ManagerRepo repo;

  ReqCubit(this.repo) : super('') {
    cliload();
    labload();
  }

  //load
  List<LabDetails> lablist = [];
  Future<void> labload() async {
    try {
      lablist = await repo.getnewLabs();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    lablist.isNotEmpty ? emit('labsloaded') : emit('error');
  }

  List<ClinicDetails> clilist = [];
  Future<void> cliload() async {
    try {
      clilist = await repo.getnewClinics();
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    lablist.isNotEmpty ? emit('labsloaded') : emit('error');
  }

  //confirm
  Future<void> cliconfirm(int id) async {
    bool status = false;
    try {
      status = await repo.confirmclinics(id);
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

  Future<void> labconfirm(int id) async {
    bool status = false;
    try {
      status = await repo.confirmlabs(id);
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
}
