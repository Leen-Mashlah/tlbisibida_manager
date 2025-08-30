// lib/presentation/clients_req/c_r_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';

// Define proper states
abstract class ReqState {}

class ReqInitial extends ReqState {}

class ReqLoading extends ReqState {
  final bool isClinicLoading;
  ReqLoading({this.isClinicLoading = true});
}

class ReqClinicsLoaded extends ReqState {
  final List<ClinicDetails> clinics;
  ReqClinicsLoaded({required this.clinics});
}

class ReqLabsLoaded extends ReqState {
  final List<LabDetails> labs;
  ReqLabsLoaded({required this.labs});
}

class ReqClinicsEmpty extends ReqState {}

class ReqLabsEmpty extends ReqState {}

class ReqError extends ReqState {
  final String message;
  ReqError({required this.message});
}

class ReqConfirming extends ReqState {
  final bool isClinic;
  ReqConfirming({required this.isClinic});
}

class ReqConfirmed extends ReqState {
  final bool isClinic;
  ReqConfirmed({required this.isClinic});
}

class ReqCubit extends Cubit<ReqState> {
  final ManagerRepo repo;

  ReqCubit(this.repo) : super(ReqInitial()) {
    cliload();
  }

  Future<void> labload() async {
    emit(ReqLoading(isClinicLoading: false));
    try {
      final labs = await repo.getnewLabs();
      if (labs.isNotEmpty) {
        emit(ReqLabsLoaded(labs: labs));
      } else {
        emit(ReqLabsEmpty());
      }
    } on Exception catch (e) {
      emit(ReqError(message: "Error loading labs: ${e.toString()}"));
      print("Error loading labs: ${e.toString()}");
    }
  }

  Future<void> cliload() async {
    emit(ReqLoading(isClinicLoading: true));
    try {
      final clinics = await repo.getnewClinics();
      if (clinics.isNotEmpty) {
        emit(ReqClinicsLoaded(clinics: clinics));
      } else {
        emit(ReqClinicsEmpty());
      }
    } on Exception catch (e) {
      emit(ReqError(message: "Error loading clinics: ${e.toString()}"));
      print("Error loading clinics: ${e.toString()}");
    }
  }

  // confirm methods
  Future<void> cliconfirm(int id) async {
    emit(ReqConfirming(isClinic: true));
    try {
      final status = await repo.confirmclinics(id);
      if (status) {
        emit(ReqConfirmed(isClinic: true));
        await cliload(); // Re-load clinics after confirmation
      } else {
        emit(ReqError(message: "Clinic confirmation failed"));
      }
    } on Exception catch (e) {
      emit(ReqError(message: e.toString()));
      print(e.toString());
    }
  }

  Future<void> labconfirm(int id) async {
    emit(ReqConfirming(isClinic: false));
    try {
      print('sending confirmation...');
      final status = await repo.confirmlabs(id);
      print('confirmation sequence complete');
      if (status) {
        print('confirmation success');
        emit(ReqConfirmed(isClinic: false));
        await labload(); // Re-load labs after confirmation
      } else {
        emit(ReqError(message: "Lab confirmation failed"));
      }
    } on Exception catch (e) {
      emit(ReqError(message: e.toString()));
      print(e.toString());
    }
  }
}
