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
    subscriptionableType = json['subscriptional_type'];
    subscriptionTo = json['subscription_to'];
    subscriptionFrom = json['subscription_from'];
    subscriptionId = json['id'];
    id = json['subscriptionable']['id'];
    // subscriptionId = json['subscription_id'];
    fullName = json['subscriptionable']['first_name'] +
        ' ' +
        json['subscriptionable']['last_name'];
    phone = json['subscriptionable']['phone'];
    address = json['subscriptionable']['address'];
    registerDate = '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscriptionable_id'];
    data['subscriptionable_type'];
    data['subscription_to'];
    data['id'] = subscriptionId;
    data['subscriptionable']['id'] = id;
    data['first_name'] = fullName;
    data['phone'] = phone;
    data['address'] = address;
    data['created_at'] = registerDate;
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
