// common_models.dart

import 'dart:convert';

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
    subscriptionableId = json['subscriptionable_id'];
    subscriptionableType = json[
        'subscriptionable_type']; // Fixed typo: 'subscriptional_type' -> 'subscriptionable_type'
    subscriptionTo = json['subscription_to'];
    subscriptionFrom = json['subscription_from'];

    // Subscription primary key, used by admin/renew-subscription. Only the
    // null-subscription endpoint returns it; subscribed-labs does not.
    subscriptionId = json['id'];

    // Get the nested subscriptionable data
    final subscriptionable = json['subscriptionable'] as Map<String, dynamic>?;
    if (subscriptionable != null) {
      id = subscriptionable['id'];
      labName = subscriptionable['lab_name'];
      labPhone = _phoneString(subscriptionable['lab_phone']);
      labAddress = subscriptionable['lab_address'];
    }

    // The API doesn't have register_date, so we'll leave it null
    registerDate = null;

    // Handle duration_as_months field with proper type conversion
    final durationValue = json[
        'duration_as_months']; // Fixed: 'register_subscription_duration' -> 'duration_as_months'
    if (durationValue != null) {
      if (durationValue is int) {
        duration = durationValue;
      } else if (durationValue is String) {
        duration = int.tryParse(durationValue);
      } else if (durationValue is double) {
        duration = durationValue.toInt();
      }
    }
  }

  DBLabDetails.fromJsonReq(Map<String, dynamic> json) {
    id = json['id'];
    labName = json['lab_name'];
    labPhone = _phoneString(json['lab_phone']);
    labAddress = json['lab_address'];
    registerDate = json['created_at'];
    duration = json['register_subscription_duration'] ?? 0;
  }

  /// `lab_phone` is a JSON-encoded string; re-encode if it arrives decoded.
  static String? _phoneString(dynamic value) {
    if (value == null || value is String) return value;
    return jsonEncode(value);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscriptionable_id'] = subscriptionableId;
    data['subscriptionable_type'] = subscriptionableType;
    data['subscription_to'] = subscriptionTo;
    data['subscription_from'] = subscriptionFrom;
    data['id'] = subscriptionId;
    data['subscriptionable'] = {'id': id};
    data['lab_name'] = labName;
    data['lab_phone'] = labPhone;
    data['lab_address'] = labAddress;
    data['register_date'] = registerDate;
    data['duration_as_months'] = duration;
    return data;
  }

  LabDetails todomain() {
    return LabDetails(
        id: id,
        subscriptionId: subscriptionId,
        subscriptionTo: subscriptionTo,
        subscriptionFrom: subscriptionFrom,
        subscriptionableType: subscriptionableType,
        subscriptionableId: subscriptionableId,
        labName: labName,
        labPhone: labPhone != null ? decodeLabPhoneNumbers(labPhone!) : null,
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
