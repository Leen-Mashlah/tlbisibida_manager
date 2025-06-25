// clinic_details_model.dart

class ClinicDetails {
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

  ClinicDetails({
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
  ClinicDetails.fromJsonReq(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['first_name'] + ' ' + json['last_name'];
    phone = json['phone'];
    address = json['address'];
    registerDate = json['created_at'];
    duration = json['register_subscription_duration'];
  }
  ClinicDetails.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscriptionable_id'];
    data['subscriptionable_type'];
    data['subscription_to'];
    data['subscription_from'];
    data['id'] = subscriptionId;
    data['subscriptionable']['id'] = id;
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['address'] = address;
    data['register_date'] = registerDate;
    return data;
  }
}
