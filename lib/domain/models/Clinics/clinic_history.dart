import 'clinic_details.dart';

class HistoryClinicsResponse {
  bool? status;
  int? successCode;
  List<ClinicDetails>? notSubscribedClinics;
  String? successMessage;

  HistoryClinicsResponse({
    this.status,
    this.successCode,
    this.notSubscribedClinics,
    this.successMessage,
  });

  HistoryClinicsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['non_subscribed_clinics'] != null) {
      notSubscribedClinics = <ClinicDetails>[];
      json['non_subscribed_clinics'].forEach((v) {
        notSubscribedClinics!.add(ClinicDetails.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (notSubscribedClinics != null) {
      data['non_subscribed_clinics'] =
          notSubscribedClinics!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}
