import 'package:lambda_dent_dash/domain/models/subscribed_clinics.dart';
import 'package:lambda_dent_dash/domain/models/subscribed_labs.dart';

abstract class ManagerRepo {
  Future<void> renewlabs(int month, int id);
  Future<void> renewclinics(int month, int id);
  Future<void> confirmlabs(int id);
  Future<void> confirmclinics(int id);
  Future<List<Lab>> getSubscribedLabs();
  Future<List<Clinic>> getSubscribedClinics();
  Future<List<Lab>> getHistoryLabs();
  Future<List<Clinic>> getHistoryClinics();
}
