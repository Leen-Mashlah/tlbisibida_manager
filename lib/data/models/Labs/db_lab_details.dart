// common_models.dart

import 'package:lambda_dent_dash/domain/models/Labs/lab_details.dart';

import 'db_lab_phone.dart';

class DBLabDetails {
  int? id;
  String? labName;
  DBLabPhone? labPhone;
  String? labAddress;
  String? registerDate;

  DBLabDetails({
    this.id,
    this.labName,
    this.labPhone,
    this.labAddress,
    this.registerDate,
  });

  DBLabDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labName = json['lab_name'];
    labPhone = json['lab_phone'] != null
        ? DBLabPhone.fromJson(json['lab_phone'])
        : null;
    labAddress = json['lab_address'];
    registerDate = json['register_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['lab_name'] = labName;
    if (labPhone != null) {
      data['lab_phone'] = labPhone!.toJson();
    }
    data['lab_address'] = labAddress;
    data['register_date'] = registerDate;
    return data;
  }

  LabDetails todomain() {
    return LabDetails(
        id: id,
        labName: labName,
        labPhone: labPhone!.home!,
        labAddress: labAddress,
        registerDate: registerDate);
  }

  static DBLabDetails fromdomain(LabDetails cd) {
    return DBLabDetails()
      ..id = cd.id
      ..labName = cd.labName
      ..labPhone = DBLabPhone(home: cd.labPhone)
      ..labAddress = cd.labAddress
      ..registerDate = cd.registerDate;
  }
}
