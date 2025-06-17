import 'package:lambda_dent_dash/domain/models/subscribed_clinics.dart';
import 'package:lambda_dent_dash/domain/models/subscribed_labs.dart';

abstract class ManagerRepo {
  Future<void> renew(int month);
  Future<void> confirm();
  Future<List<Lab>> getSubscribedLabs();
  Future<List<Clinic>> getSubscribedClinics();
  Future<List<Lab>> getHistoryLabs();
  Future<List<Clinic>> getHistoryClinics();
}
