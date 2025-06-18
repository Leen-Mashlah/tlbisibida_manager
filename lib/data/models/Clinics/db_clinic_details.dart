// clinic_details_model.dart

import 'package:lambda_dent_dash/domain/models/Clinics/clinic_details.dart';

class DBClinicDetails {
  int? id;
  String? fullName;
  int? phone;
  String? address;
  String? registerDate;

  DBClinicDetails({
    this.id,
    this.fullName,
    this.phone,
    this.address,
    this.registerDate,
  });

  DBClinicDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phone = json['phone'];
    address = json['address'];
    registerDate = json['register_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['address'] = address;
    data['register_date'] = registerDate;
    return data;
  }

  ClinicDetails todomain() {
    return ClinicDetails(
        id: id,
        fullName: fullName,
        phone: phone,
        address: address,
        registerDate: registerDate);
  }

  static DBClinicDetails fromdomain(ClinicDetails cd) {
    return DBClinicDetails()
      ..id = cd.id
      ..fullName = cd.fullName
      ..phone = cd.phone
      ..address = cd.address
      ..registerDate = cd.registerDate;
  }
}
