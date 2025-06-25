import 'db_lab_details.dart';

class DBHistoryLabsResponse {
  bool? status;
  int? successCode;
  List<DBLabDetails>? subscribedNotSubscribeLabs; // Reusing LabDetails
  String? successMessage;

  DBHistoryLabsResponse({
    this.status,
    this.successCode,
    this.subscribedNotSubscribeLabs,
    this.successMessage,
  });

  DBHistoryLabsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['non_subscribed_labs'] != null) {
      subscribedNotSubscribeLabs = <DBLabDetails>[];
      json['non_subscribed_labs'].forEach((v) {
        subscribedNotSubscribeLabs!
            .add(DBLabDetails.fromJson(v)); // Using LabDetails
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (subscribedNotSubscribeLabs != null) {
      data['non_subscribed_labs'] =
          subscribedNotSubscribeLabs!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}
