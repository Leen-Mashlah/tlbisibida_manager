class SubscribedLabsResponse {
  bool? status;
  int? successCode;
  List<SubscribedLab>? subscribedLabs;
  String? successMessage;

  SubscribedLabsResponse(
      {this.status,
      this.successCode,
      this.subscribedLabs,
      this.successMessage});

  SubscribedLabsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    successCode = json['success_code'];
    if (json['subscribed-labs'] != null) {
      subscribedLabs = <SubscribedLab>[];
      json['subscribed-labs'].forEach((v) {
        subscribedLabs!.add(SubscribedLab.fromJson(v));
      });
    }
    successMessage = json['success_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success_code'] = successCode;
    if (subscribedLabs != null) {
      data['subscribed-labs'] = subscribedLabs!.map((v) => v.toJson()).toList();
    }
    data['success_message'] = successMessage;
    return data;
  }
}

class SubscribedLab {
  int? id;
  String? labName;
  LabPhone? labPhone;
  String? labAddress;
  String? registerDate;

  SubscribedLab(
      {this.id,
      this.labName,
      this.labPhone,
      this.labAddress,
      this.registerDate});

  SubscribedLab.fromJson(Map<String, dynamic> json) {
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

class LabPhone {
  String? home;
  String? work;
  String? mobile;

  LabPhone({this.home, this.work, this.mobile});

  LabPhone.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    work = json['work'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['work'] = work;
    data['mobile'] = mobile;
    return data;
  }
}
