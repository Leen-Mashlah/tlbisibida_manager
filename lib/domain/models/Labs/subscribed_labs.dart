// subscribed_labs_response.dart
import 'lab_details.dart'; // Import common models

class SubscribedLabsResponse {
  bool? status;
  int? successCode;
  List<LabDetails>? subscribedLabs; // <--- Using the common LabDetails
  String? successMessage;

  SubscribedLabsResponse(
      {this.status,
      this.successCode,
      this.subscribedLabs,
      this.successMessage});

  SubscribedLabsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['subscribed-labs'] != null) {
      subscribedLabs = <LabDetails>[]; // <--- Using LabDetails
      json['subscribed-labs'].forEach((v) {
        subscribedLabs!.add(LabDetails.fromJson(v)); // <--- Using LabDetails
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
