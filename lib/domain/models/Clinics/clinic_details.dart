// clinic_details_model.dart

class ClinicDetails {
  int? id;
  String? fullName;
  int? phone; 
  String? address;
  String? registerDate;

  ClinicDetails({
    this.id,
    this.fullName,
    this.phone,
    this.address,
    this.registerDate,
  });

  ClinicDetails.fromJson(Map<String, dynamic> json) {
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
}
