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
    subscriptionableType = json[
        'subscriptionable_type']; // Fixed typo: 'subscriptional_type' -> 'subscriptionable_type'
    subscriptionTo = json['subscription_to'];
    subscriptionFrom = json['subscription_from'];

    // The API doesn't have a top-level 'id' field, so we'll use subscriptionable_id
    subscriptionId = json['subscriptionable_id'];

    // Get the nested subscriptionable data
    final subscriptionable = json['subscriptionable'] as Map<String, dynamic>?;
    if (subscriptionable != null) {
      id = subscriptionable['id'];
      labName = subscriptionable['lab_name'];
      labPhone = decodeLabPhoneNumbers(subscriptionable['lab_phone']);
      labAddress = subscriptionable['lab_address'];
    }

    // The API doesn't have register_date, so we'll leave it null
    registerDate = null;

    // Handle duration_as_months field with proper type conversion
    final durationValue =
        json['duration_as_months']; // Fixed: 'duration' -> 'duration_as_months'
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscriptionable_id'] = subscriptionableId;
    data['subscriptionable_type'] = subscriptionableType;
    data['subscription_to'] = subscriptionTo;
    data['subscription_from'] = subscriptionFrom;
    data['id'] = subscriptionId;
    data['subscriptionable'] = {'id': id};
    data['lab_name'] = labName;
    data['lab_phone'] =
        labPhone != null ? encodeLabPhoneNumbers(labPhone!) : null;
    data['lab_address'] = labAddress;
    data['register_date'] = registerDate;
    data['duration'] = duration;
    return data;
  }
}
