import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lambda_dent_dash/data/models/Clinics/db_clinic_history.dart';
import 'package:lambda_dent_dash/data/models/Clinics/db_clinic_join_request.dart';
import 'package:lambda_dent_dash/data/models/Clinics/db_subscribed_clinics.dart';
import 'package:lambda_dent_dash/data/models/Labs/db_lab_history.dart';
import 'package:lambda_dent_dash/data/models/Labs/db_lab_join_request.dart';
import 'package:lambda_dent_dash/data/models/Labs/db_subscribed_labs.dart';
import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';
import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';

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

  DBHistoryClinicsResponse? dbHistoryClinicsResponse;
  @override
  Future<List<ClinicDetails>> getHistoryClinics() async {
    await DioHelper.getData('clinics/null-subscription', token: '')
        .then((value) {
      dbHistoryClinicsResponse = DBHistoryClinicsResponse.fromJson(value?.data);
    }).catchError((error) {
      print('error: ' + error.toString());
    });
    List<ClinicDetails> cliniclist = [];
    for (var clinic in dbHistoryClinicsResponse!.notSubscribedClinics!) {
      cliniclist.add(clinic.todomain());
    }
    return cliniclist;
  }

  DBHistoryLabsResponse? dbHistoryLabsResponse;
  @override
  Future<List<LabDetails>> getHistoryLabs() async {
    await DioHelper.getData('labs/null-subscription', token: '').then((value) {
      dbHistoryLabsResponse = DBHistoryLabsResponse.fromJson(value?.data);
    });
    List<LabDetails> lablist = [];
    for (var lab in dbHistoryLabsResponse!.subscribedNotSubscribeLabs!) {
      lablist.add(lab.todomain());
    }
    return lablist;
  }

  DBSubscribedClinicsResponse? dbSubscribedClinicsResponse;
  @override
  Future<List<ClinicDetails>> getSubscribedClinics() async {
    await DioHelper.getData('subscribed-clinics', token: '').then((value) {
      dbSubscribedClinicsResponse =
          DBSubscribedClinicsResponse.fromJson(value?.data);
    });
    List<ClinicDetails> cliniclist = [];
    for (var clnc in dbSubscribedClinicsResponse!.subscribedClinics!) {
      cliniclist.add(clnc.todomain());
    }
    return cliniclist;
  }

  DBSubscribedLabsResponse? dbSubscribedLabsResponse;
  @override
  Future<List<LabDetails>> getSubscribedLabs() async {
    await DioHelper.getData('subcribed-labs', token: '').then((value) {
      dbSubscribedLabsResponse = DBSubscribedLabsResponse.fromJson(value!.data);
    });
    List<LabDetails> lablist = [];
    for (var labdet in dbSubscribedLabsResponse!.subscribedLabs!) {
      lablist.add(labdet.todomain());
    }
    return lablist;
  }

  DBLabsJoinRequestResponse? dbLabsJoinRequestResponse;
  @override
  Future<List<LabDetails>> getnewLabs() async {
    await DioHelper.getData('new-labs', token: '').then((value) {
      dbLabsJoinRequestResponse =
          DBLabsJoinRequestResponse.fromJson(value!.data);
    });
    List<LabDetails> lablist = [];
    for (var labdet in dbLabsJoinRequestResponse!.labsJoinRequest!) {
      lablist.add(labdet.todomain());
    }
    return lablist;
  }

  DBClinicJoinRequestResponse? dbClinicJoinRequestResponse;
  @override
  Future<List<ClinicDetails>> getnewClinics() async {
    await DioHelper.getData('new-clinics', token: '').then((value) {
      dbClinicJoinRequestResponse =
          DBClinicJoinRequestResponse.fromJson(value!.data);
    });
    List<ClinicDetails> clilist = [];
    for (var labdet in dbClinicJoinRequestResponse!.joinOrdersClinics!) {
      clilist.add(labdet.todomain());
    }
    return clilist;
  }
}
