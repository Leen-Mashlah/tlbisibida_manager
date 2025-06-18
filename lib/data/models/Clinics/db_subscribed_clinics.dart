// subscribed_clinics_response.dart

import 'db_clinic_details.dart';

class DBSubscribedClinicsResponse {
  bool? status;
  int? successCode;
  List<DBClinicDetails>? subscribedClinics; // <--- Using ClinicDetails
  String? successMessage;

  DBSubscribedClinicsResponse(
      {this.status,
      this.successCode,
      this.subscribedClinics,
      this.successMessage});

  DBSubscribedClinicsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['subscribed-clinics'] != null) {
      subscribedClinics = <DBClinicDetails>[]; // <--- Using ClinicDetails
      json['subscribed-clinics'].forEach((v) {
        subscribedClinics!
            .add(DBClinicDetails.fromJson(v)); // <--- Using ClinicDetails
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (subscribedClinics != null) {
      data['subscribed-clinics'] =
          subscribedClinics!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}
