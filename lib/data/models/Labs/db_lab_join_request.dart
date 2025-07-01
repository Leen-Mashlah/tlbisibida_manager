import 'db_lab_details.dart';

class DBLabsJoinRequestResponse {
  bool? status;
  int? successCode;
  List<DBLabDetails>? labsJoinRequest; // <--- Using the common LabDetails
  String? successMessage;

  DBLabsJoinRequestResponse(
      {this.status,
      this.successCode,
      this.labsJoinRequest,
      this.successMessage});

  DBLabsJoinRequestResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['labs_register_requests'] != null) {
      labsJoinRequest = <DBLabDetails>[]; // <--- Using LabDetails
      json['labs_register_requests'].forEach((v) {
        labsJoinRequest!.add(DBLabDetails.fromJson(v)); // <--- Using LabDetails
      });
    }
    successMessage = json['success_message'];
  }
  DBLabsJoinRequestResponse.fromJsonReq(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['labs_register_requests'] != null) {
      labsJoinRequest = <DBLabDetails>[]; // <--- Using LabDetails
      json['labs_register_requests'].forEach((v) {
        labsJoinRequest!.add(DBLabDetails.fromJsonReq(v)); // <--- Using LabDetails
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (labsJoinRequest != null) {
      data['labs_register_requests'] =
          labsJoinRequest!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}
