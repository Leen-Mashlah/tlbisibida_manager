// subscribed_labs_response.dart
import 'db_lab_details.dart'; // Import common models

class DBSubscribedLabsResponse {
  bool? status;
  int? successCode;
  List<DBLabDetails>? subscribedLabs; // <--- Using the common LabDetails
  String? successMessage;

  DBSubscribedLabsResponse(
      {this.status,
      this.successCode,
      this.subscribedLabs,
      this.successMessage});

  DBSubscribedLabsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['subscribed-labs'] != null) {
      subscribedLabs = <DBLabDetails>[]; // <--- Using LabDetails
      json['subscribed-labs'].forEach((v) {
        subscribedLabs!.add(DBLabDetails.fromJson(v)); // <--- Using LabDetails
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (subscribedLabs != null) {
      data['subscribed-labs'] = subscribedLabs!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}
