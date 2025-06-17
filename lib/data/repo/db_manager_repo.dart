import 'package:dio/dio.dart';
import 'package:lambda_dent_dash/domain/models/subscribed_clinics.dart';
import 'package:lambda_dent_dash/domain/models/subscribed_labs.dart';
import 'package:lambda_dent_dash/domain/repo/manager_repo.dart';
import 'package:lambda_dent_dash/services/dio/dio.dart';

class DbManagerRepo implements ManagerRepo {
  @override
  Future<void> confirmlabs(int id) {
    return DioHelper.updateData(
      'lab-manager/accept-join-order-of-lab/$id',
      {},
    ).then(
      (value) {
        if (value?.data['status']) {}
      },
    ).catchError((error) {});
  }

  @override
  Future<void> confirmclinics(int id) {
    return DioHelper.updateData(
      'clinic/accept-join-order-of-clinic/$id',
      {},
    ).then(
      (value) {
        if (value?.data['status']) {}
      },
    ).catchError((error) {});
  }

  @override
  Future<void> renewlabs(int month, int id) {
    return DioHelper.postData(
        "renew-subscription-of-lab?lab_id=$id&months=$month&subscription_value=0",
        {}).then(
      (value) {
        if (value?.data['status']) {}
      },
    ).catchError((error) {});
  }

  @override
  Future<void> renewclinics(int month, int id) {
    return DioHelper.postData(
        "renew-subscription-of-clinic?dentist_id=$id&months=$month&subscription_value=0",
        {}).then(
      (value) {
        if (value?.data['status']) {}
      },
    ).catchError((error) {});
  }

  @override
  Future<List<Clinic>> getHistoryClinics() {
    // TODO: implement getHistoryClinics
    throw UnimplementedError();
  }

  @override
  Future<List<Lab>> getHistoryLabs() {
    // TODO: implement getHistoryLabs
    throw UnimplementedError();
  }

  @override
  Future<List<Clinic>> getSubscribedClinics() {
    // TODO: implement getSubscribedClinics
    throw UnimplementedError();
  }

  @override
  Future<List<Lab>> getSubscribedLabs() {
    // TODO: implement getSubscribedLabs
    throw UnimplementedError();
  }
}
