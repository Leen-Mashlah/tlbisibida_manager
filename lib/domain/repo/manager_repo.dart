import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';

abstract class ManagerRepo {
  Future<void> renewlabs(int month, int id);
  Future<void> renewclinics(int month, int id);
  Future<void> confirmlabs(int id);
  Future<void> confirmclinics(int id);

  Future<List<LabDetails>> getSubscribedLabs();
  Future<List<ClinicDetails>> getSubscribedClinics();
  Future<List<LabDetails>> getHistoryLabs();
  Future<List<ClinicDetails>> getHistoryClinics();
  Future<List<ClinicDetails>> getnewClinics();
  Future<List<LabDetails>> getnewLabs();
}
