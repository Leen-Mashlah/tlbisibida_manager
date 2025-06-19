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
    lablist = await repo.getnewLabs();
    emit('labsloaded');
  }

  List<ClinicDetails> clilist = [];
  Future<void> cliload() async {
    clilist = await repo.getnewClinics();
    emit('cliloaded');
  }

  //confirm
  Future<void> cliconfirm(int id) async {
    await repo.confirmclinics(id);
    emit('confirmed');
  }

  Future<void> labconfirm(int id) async {
    await repo.confirmlabs(id);
    emit('confirmed');
  }
}
