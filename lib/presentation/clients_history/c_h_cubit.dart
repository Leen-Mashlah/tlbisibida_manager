import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';

// Define proper states
abstract class HisState {}

class HisInitial extends HisState {}

class HisLoading extends HisState {
  final bool isClinicLoading;
  HisLoading({this.isClinicLoading = true});
}

class HisClinicsLoaded extends HisState {
  final List<ClinicDetails> clinics;
  HisClinicsLoaded({required this.clinics});
}

class HisLabsLoaded extends HisState {
  final List<LabDetails> labs;
  HisLabsLoaded({required this.labs});
}

class HisClinicsEmpty extends HisState {}

class HisLabsEmpty extends HisState {}

class HisError extends HisState {
  final String message;
  HisError({required this.message});
}

class HisRenewing extends HisState {}

class HisRenewed extends HisState {}

class HisCubit extends Cubit<HisState> {
  final ManagerRepo repo;

  HisCubit(this.repo) : super(HisInitial()) {
    cliload();
  }

  Future<void> labload() async {
    emit(HisLoading(isClinicLoading: false));
    try {
      final labs = await repo.getHistoryLabs();
      if (labs.isNotEmpty) {
        emit(HisLabsLoaded(labs: labs));
      } else {
        emit(HisLabsEmpty());
      }
    } on Exception catch (e) {
      emit(HisError(message: "Error loading labs: ${e.toString()}"));
      print("Error loading labs: ${e.toString()}");
    }
  }

  Future<void> cliload() async {
    emit(HisLoading(isClinicLoading: true));
    try {
      final clinics = await repo.getHistoryClinics();
      if (clinics.isNotEmpty) {
        emit(HisClinicsLoaded(clinics: clinics));
      } else {
        emit(HisClinicsEmpty());
      }
    } on Exception catch (e) {
      emit(HisError(message: "Error loading clinics: ${e.toString()}"));
      print("Error loading clinics: ${e.toString()}");
    }
  }

  //Renew
  Future<void> renew(int month, int id) async {
    emit(HisRenewing());
    try {
      final status = await repo.renew(month, id);
      if (status) {
        emit(HisRenewed());
      } else {
        emit(HisError(message: "Renewal failed"));
      }
    } on Exception catch (e) {
      emit(HisError(message: e.toString()));
      print(e.toString());
    }
  }
}
