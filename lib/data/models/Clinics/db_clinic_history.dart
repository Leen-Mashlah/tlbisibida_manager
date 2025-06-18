import 'db_clinic_details.dart';

class DBHistoryClinicsResponse {
  bool? status;
  int? successCode;
  List<DBClinicDetails>? notSubscribedClinics;
  String? successMessage;

  DBHistoryClinicsResponse({
    this.status,
    this.successCode,
    this.notSubscribedClinics,
    this.successMessage,
  });

  DBHistoryClinicsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['not-subscribed-clinics'] != null) {
      notSubscribedClinics = <DBClinicDetails>[];
      json['not-subscribed-clinics'].forEach((v) {
        notSubscribedClinics!.add(DBClinicDetails.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (notSubscribedClinics != null) {
      data['not-subscribed-clinics'] =
          notSubscribedClinics!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}
