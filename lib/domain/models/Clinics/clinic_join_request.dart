import 'clinic_details.dart';

class ClinicJoinRequestResponse {
  bool? status;
  int? successCode;
  List<ClinicDetails>? joinOrdersClinics;
  String? successMessage;

  ClinicJoinRequestResponse({
    this.status,
    this.successCode,
    this.joinOrdersClinics,
    this.successMessage,
  });

  ClinicJoinRequestResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['clinics_register_requests'] != null) {
      joinOrdersClinics = <ClinicDetails>[];
      json['clinics_register_requests'].forEach((v) {
        joinOrdersClinics!.add(ClinicDetails.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (joinOrdersClinics != null) {
      data['clinics_register_requests'] =
          joinOrdersClinics!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}
