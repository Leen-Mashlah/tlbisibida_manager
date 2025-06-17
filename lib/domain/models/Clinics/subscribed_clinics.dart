import 'clinic_details.dart';

class SubscribedClinicsResponse {
  bool? status;
  int? successCode;
  List<ClinicDetails>? subscribedClinics; 
  String? successMessage;

  SubscribedClinicsResponse(
      {this.status,
      this.successCode,
      this.subscribedClinics,
      this.successMessage});

  SubscribedClinicsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['subscribed-clinics'] != null) {
      subscribedClinics = <ClinicDetails>[]; 
      json['subscribed-clinics'].forEach((v) {
        subscribedClinics!
            .add(ClinicDetails.fromJson(v)); 
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
