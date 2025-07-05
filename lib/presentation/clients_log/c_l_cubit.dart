import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';

class LogCubit extends Cubit<String> {
  final ManagerRepo repo;

  LogCubit(this.repo) : super('initial') {
    cliload();
  }

  //load
  List<LabDetails> lablist = [];
  Future<void> labload() async {
    emit('lab_loading');
    try {
      lablist = await repo.getSubscribedLabs();
      if (lablist.isNotEmpty) {
        emit('labsloaded');
      } else {
        emit('no_labs_found'); // A more specific state
      }
    } on Exception catch (e) {
      emit('error');
      print("Error loading labs: ${e.toString()}");
    }
    print("Lab list state: $state, Labs: ${lablist.length}");
  }

  List<ClinicDetails> clilist = [];
  Future<void> cliload() async {
    emit('clinic_loading'); 
    try {
      clilist = await repo.getSubscribedClinics();
      if (clilist.isNotEmpty) {
        emit('cliloaded');
      } else {
        emit('no_clinics_found'); // A more specific state
      }
    } on Exception catch (e) {
      emit('error');
      print("Error loading clinics: ${e.toString()}");
    }
    print("Clinic list state: $state, Clinics: ${clilist.length}");
  }
}
