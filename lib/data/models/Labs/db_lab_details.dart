// common_models.dart

import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';
import 'package:lambda_dent_dash/domain/repo/lapphone_chat.dart';

class DBLabDetails {
  int? subscriptionableId;
  String? subscriptionableType;
  String? subscriptionTo;
  String? subscriptionFrom;
  int? id;
  int? subscriptionId;
  String? labName;
  String? labPhone;
  String? labAddress;
  String? registerDate;
  int? duration;

  DBLabDetails({
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
  });

  DBLabDetails.fromJson(Map<String, dynamic> json) {
    subscriptionableId = json['subscriptionable_id'] ?? '';
    subscriptionableType = json['subscriptional_type'] ?? '';
    subscriptionTo = json['subscription_to'] ?? '';
    subscriptionFrom = json['subscription_from'] ?? '';
    subscriptionId = json['id'] ?? '';
    id = json['subscriptionable']['id'];
    labName = json['lab_name'];
    labPhone = json['lab_phone'];
    labAddress = json['lab_address'];
    registerDate = json['register_date'];
    duration = json['register_subscription_duration'];
  }

  DBLabDetails.fromJsonReq(Map<String, dynamic> json) {
    id = json['id'];
    labName = json['lab_name'];
    labPhone = json['lab_phone'];
    labAddress = json['lab_address'];
    registerDate = json['created_at'];
    duration = json['register_subscription_duration'] ?? 0;
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
    data['lab_phone'] = labPhone;
    data['lab_address'] = labAddress;
    data['register_date'] = registerDate;
    data['register_subscription_duration'] = duration;
    return data;
  }

  LabDetails todomain() {
    return LabDetails(
        id: id,
        subscriptionId: subscriptionId,
        subscriptionTo: subscriptionTo,
        subscriptionableType: subscriptionableType,
        labName: labName,
        labPhone: decodeLabPhoneNumbers(labPhone!),
        labAddress: labAddress,
        registerDate: registerDate,
        duration: duration);
  }

  static DBLabDetails fromdomain(LabDetails cd) {
    return DBLabDetails()
      ..id = cd.id
      ..subscriptionId = cd.subscriptionId
      ..subscriptionTo = cd.subscriptionTo
      ..subscriptionFrom = cd.subscriptionFrom
      ..subscriptionableType = cd.subscriptionableType
      ..labName = cd.labName
      ..labPhone = encodeLabPhoneNumbers(cd.labPhone!)
      ..labAddress = cd.labAddress
      ..registerDate = cd.registerDate
      ..duration = cd.duration;
  }
}
