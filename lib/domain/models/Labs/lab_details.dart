// common_models.dart



import '../lab_phone';

class LabDetails {
  int? id;
  String? labName;
  LabPhone? labPhone;
  String? labAddress;
  String? registerDate;

  LabDetails({
    this.id,
    this.labName,
    this.labPhone,
    this.labAddress,
    this.registerDate,
  });

  LabDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    labName = json['lab_name'];
    labPhone =
        json['lab_phone'] != null ? LabPhone.fromJson(json['lab_phone']) : null;
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
}
