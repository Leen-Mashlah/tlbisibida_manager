// clinic_details_model.dart

import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';

/*
            "subscriptionable_id": 4,
            "subscriptionable_type": "dentist",
            "subscription_to": "2025-09-23",
            "register_subscription_duration": 3,
            */
class DBClinicDetails {
  int? subscriptionableId;
  String? subscriptionableType;
  String? subscriptionTo;
  String? subscriptionFrom;
  int? id;
  int? subscriptionId;
  String? fullName;
  int? phone;
  String? address;
  String? registerDate;
  int? duration;

  DBClinicDetails({
    this.subscriptionableId,
    this.subscriptionableType,
    this.subscriptionTo,
    this.subscriptionFrom,
    this.id,
    this.subscriptionId,
    this.fullName,
    this.phone,
    this.address,
    this.registerDate,
    this.duration,
  });

  DBClinicDetails.fromJsonReq(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['first_name'] + ' ' + json['last_name'];
    phone = json['phone'];
    address = json['address'];
    registerDate = json['created_at'];
    duration = json['register_subscription_duration'];
  }
  DBClinicDetails.fromJson(Map<String, dynamic> json) {
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

      // Safely concatenate names
      final firstName = subscriptionable['first_name'] ?? '';
      final lastName = subscriptionable['last_name'] ?? '';
      fullName = '$firstName $lastName'.trim();

      // Handle phone field with proper type conversion
      final phoneValue = subscriptionable['phone'];
      if (phoneValue != null) {
        if (phoneValue is int) {
          phone = phoneValue;
        } else if (phoneValue is String) {
          phone = int.tryParse(phoneValue);
        } else if (phoneValue is double) {
          phone = phoneValue.toInt();
        }
      }

      address = subscriptionable['address'];
    }

    // The API doesn't have register_date, so we'll leave it empty
    registerDate = '';

    // Handle duration field if it exists
    final durationValue = json['duration_as_months'];
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
    data['first_name'] = fullName;
    data['phone'] = phone;
    data['address'] = address;
    data['created_at'] = registerDate;
    data['duration_as_months'] = duration;
    return data;
  }

  Map<String, dynamic> toJsonReq() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['first_name'] = fullName;
    data['phone'] = phone;
    data['address'] = address;
    data['created_at'] = registerDate;
    data['register_subscription_duration'] = duration;
    return data;
  }

  ClinicDetails todomain() {
    return ClinicDetails(
        id: id,
        subscriptionId: subscriptionId,
        subscriptionTo: subscriptionTo,
        subscriptionFrom: subscriptionFrom,
        subscriptionableType: subscriptionableType,
        subscriptionableId: subscriptionableId,
        fullName: fullName,
        phone: phone,
        address: address,
        registerDate: registerDate,
        duration: duration);
  }

  static DBClinicDetails fromdomain(ClinicDetails cd) {
    return DBClinicDetails()
      ..id = cd.id
      ..subscriptionId = cd.subscriptionId
      ..subscriptionTo = cd.subscriptionTo
      ..subscriptionFrom = cd.subscriptionFrom
      ..subscriptionableType = cd.subscriptionableType
      ..fullName = cd.fullName
      ..phone = cd.phone
      ..address = cd.address
      ..registerDate = cd.registerDate
      ..duration = cd.duration;
  }
}
