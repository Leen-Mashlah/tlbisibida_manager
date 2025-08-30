import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';

// Define proper states
abstract class LogState {}

class LogInitial extends LogState {}

class LogLoading extends LogState {
  final bool isClinicLoading;
  LogLoading({this.isClinicLoading = true});
}

class LogClinicsLoaded extends LogState {
  final List<ClinicDetails> clinics;
  LogClinicsLoaded({required this.clinics});
}

class LogLabsLoaded extends LogState {
  final List<LabDetails> labs;
  LogLabsLoaded({required this.labs});
}

class LogClinicsEmpty extends LogState {}

class LogLabsEmpty extends LogState {}

class LogError extends LogState {
  final String message;
  LogError({required this.message});
}

class LogCubit extends Cubit<LogState> {
  final ManagerRepo repo;

  LogCubit(this.repo) : super(LogInitial()) {
    cliload();
  }

  Future<void> labload() async {
    emit(LogLoading(isClinicLoading: false));
    try {
      final labs = await repo.getSubscribedLabs();
      if (labs.isNotEmpty) {
        emit(LogLabsLoaded(labs: labs));
      } else {
        emit(LogLabsEmpty());
      }
    } on Exception catch (e) {
      emit(LogError(message: "Error loading labs: ${e.toString()}"));
      print("Error loading labs: ${e.toString()}");
    }
  }

  Future<void> cliload() async {
    emit(LogLoading(isClinicLoading: true));
    try {
      final clinics = await repo.getSubscribedClinics();
      if (clinics.isNotEmpty) {
        emit(LogClinicsLoaded(clinics: clinics));
      } else {
        emit(LogClinicsEmpty());
      }
    } on Exception catch (e) {
      emit(LogError(message: "Error loading clinics: ${e.toString()}"));
      print("Error loading clinics: ${e.toString()}");
    }
  }
}
