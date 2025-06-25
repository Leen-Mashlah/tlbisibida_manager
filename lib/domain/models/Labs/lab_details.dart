// common_models.dart

import 'package:lambda_dent_dash/domain/repo/lapphone_chat.dart';

class LabDetails {
  int? subscriptionableId;
  String? subscriptionableType;
  String? subscriptionTo;
  String? subscriptionFrom;
  int? id;
  int? subscriptionId;
  String? labName;
  List<String>? labPhone;
  String? labAddress;
  String? registerDate;
  int? duration;

  LabDetails({
    this.subscriptionableId,
    this.subscriptionableType,
    this.subscriptionTo,
    this.subscriptionFrom,
    this.id,
    this.subscriptionId,
    this.labName,
    this.labPhone,
    this.labAddress,
    this.registerDate,
    this.duration,
  });

  LabDetails.fromJson(Map<String, dynamic> json) {
    subscriptionableId = json['subscriptionable_id'];
    subscriptionableType = json['subscriptional_type'];
    subscriptionTo = json['subscription_to'];
    subscriptionFrom = json['subscription_from'];
    subscriptionId = json['id'];
    id = json['subscriptionable']['id'];
    labName = json['lab_name'];
    labPhone = decodeLabPhoneNumbers(json['lab_phone']);
    labAddress = json['lab_address'];
    registerDate = json['register_date'];
    registerDate = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscriptionable_id'];
    data['subscriptionable_type'];
    data['subscription_to'];
    data['subscription_from'];
    data['id'] = subscriptionId;
    data['subscriptionable']['id'] = id;
    data['lab_name'] = labName;
    data['lab_phone'] = encodeLabPhoneNumbers(labPhone!);
    data['lab_address'] = labAddress;
    data['register_date'] = registerDate;
    data['duration'] = duration;
    return data;
  }
}
