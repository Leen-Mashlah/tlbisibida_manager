import 'lab_details.dart';

class HistoryLabsResponse {
  bool? status;
  int? successCode;
  List<LabDetails>? subscribedNotSubscribeLabs; // Reusing LabDetails
  String? successMessage;

  HistoryLabsResponse({
    this.status,
    this.successCode,
    this.subscribedNotSubscribeLabs,
    this.successMessage,
  });

  HistoryLabsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['subscribed-not-subscribe-labs'] != null) {
      subscribedNotSubscribeLabs = <LabDetails>[];
      json['subscribed-not-subscribe-labs'].forEach((v) {
        subscribedNotSubscribeLabs!
            .add(LabDetails.fromJson(v)); // Using LabDetails
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (subscribedNotSubscribeLabs != null) {
      data['subscribed-not-subscribe-labs'] =
          subscribedNotSubscribeLabs!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}
