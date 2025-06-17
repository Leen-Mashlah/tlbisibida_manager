class ClinicsResponse {
  bool? status;
  int? successCode;
  List<Clinic>? Clinics;
  String? successMessage;

  ClinicsResponse(
      {this.status, this.successCode, this.Clinics, this.successMessage});

  ClinicsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['subscribed-clinics'] != null) {
      Clinics = <Clinic>[];
      json['subscribed-clinics'].forEach((v) {
        Clinics!.add(Clinic.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (Clinics != null) {
      data['subscribed-clinics'] = Clinics!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class Clinic {
  int? id;
  String? fullName;
  int? phone;
  String? address;
  String? registerDate;

  Clinic({this.id, this.fullName, this.phone, this.address, this.registerDate});

  Clinic.fromJson(Map<String, dynamic> json) {
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
