import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';

abstract class ManagerRepo {
  Future<void> renew(int month);
  Future<void> confirm();
  Future<List<LabDetails>> getSubscribedLabs();
  Future<List<ClinicDetails>> getSubscribedClinics();
  Future<List<LabDetails>> getHistoryLabs();
  Future<List<ClinicDetails>> getHistoryClinics();
}
