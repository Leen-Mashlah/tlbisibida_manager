// lib/presentation/clients_req/c_r_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';

class ReqCubit extends Cubit<String> {
  final ManagerRepo repo;

  ReqCubit(this.repo) : super('initial') {
    // Start with a clear initial state
    cliload(); // Kick off initial clinic load
    labload(); // Kick off initial lab load
  }

  List<LabDetails> lablist = [];
  Future<void> labload() async {
    emit('lab_loading'); // Indicate that labs are loading
    try {
      lablist = await repo.getnewLabs();
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
    emit('clinic_loading'); // Indicate that clinics are loading
    try {
      clilist = await repo.getnewClinics();
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

  // confirm methods (unchanged logic, just ensures a re-load)
  Future<void> cliconfirm(int id) async {
    emit('confirming_clinic');
    bool status = false;
    try {
      status = await repo.confirmclinics(id);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    if (status) {
      emit('confirmed_clinic'); // Indicate success
      await cliload(); // Re-load clinics after confirmation
    } else {
      emit('error'); // Or a more specific 'clinic_confirmation_failed'
    }
  }

  Future<void> labconfirm(int id) async {
    emit('confirming_lab');
    bool status = false;
    try {
      status = await repo.confirmlabs(id);
    } on Exception catch (e) {
      emit('error');
      print(e.toString());
    }
    if (status) {
      emit('confirmed_lab'); // Indicate success
      await labload(); // Re-load labs after confirmation
    } else {
      emit('error'); // Or a more specific 'lab_confirmation_failed'
    }
  }
}
