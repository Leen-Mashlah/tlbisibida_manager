import 'lab_details.dart';

class LabsJoinRequestResponse {
  bool? status;
  int? successCode;
  List<LabDetails>? labsJoinRequest; // <--- Using the common LabDetails
  String? successMessage;

  LabsJoinRequestResponse(
      {this.status,
      this.successCode,
      this.labsJoinRequest,
      this.successMessage});

  LabsJoinRequestResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['labs-join-Request'] != null) {
      labsJoinRequest = <LabDetails>[]; // <--- Using LabDetails
      json['labs-join-Request'].forEach((v) {
        labsJoinRequest!.add(LabDetails.fromJson(v)); // <--- Using LabDetails
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (labsJoinRequest != null) {
      data['labs-join-Request'] =
          labsJoinRequest!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}
