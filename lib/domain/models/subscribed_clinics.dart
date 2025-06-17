class SubscribedClinicsResponse {
  bool? status;
  int? successCode;
  List<SubscribedClinic>? subscribedClinics;
  String? successMessage;

  SubscribedClinicsResponse(
      {this.status,
      this.successCode,
      this.subscribedClinics,
      this.successMessage});

  SubscribedClinicsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['subscribed-clinics'] != null) {
      subscribedClinics = <SubscribedClinic>[];
      json['subscribed-clinics'].forEach((v) {
        subscribedClinics!.add(SubscribedClinic.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (subscribedClinics != null) {
      data['subscribed-clinics'] =
          subscribedClinics!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class SubscribedClinic {
  int? id;
  String? fullName;
  int? phone;
  String? address;
  String? registerDate;

  SubscribedClinic(
      {this.id, this.fullName, this.phone, this.address, this.registerDate});

  SubscribedClinic.fromJson(Map<String, dynamic> json) {
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
