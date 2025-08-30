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

    // Handle phone field with proper type conversion
    final phoneValue = json['phone'];
    if (phoneValue != null) {
      if (phoneValue is int) {
        phone = phoneValue;
      } else if (phoneValue is String) {
        phone = int.tryParse(phoneValue);
      } else if (phoneValue is double) {
        phone = phoneValue.toInt();
      }
    }

    address = json['address'];
    registerDate = json['created_at'];

    // Handle duration field with proper type conversion
    final durationValue = json['register_subscription_duration'];
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

  ClinicDetails.fromJson(Map<String, dynamic> json) {
    subscriptionableId = json['subscriptionable_id'];
    subscriptionableType = json['subscriptional_type'];
    subscriptionTo = json['subscription_to'];
    subscriptionFrom = json['subscription_from'];
    subscriptionId = json['id'];
    id = json['subscriptionable']?['id'];

    // Safely concatenate names
    final firstName = json['subscriptionable']?['first_name'] ?? '';
    final lastName = json['subscriptionable']?['last_name'] ?? '';
    fullName = '$firstName $lastName'.trim();

    // Handle phone field with proper type conversion
    final phoneValue = json['subscriptionable']?['phone'];
    if (phoneValue != null) {
      if (phoneValue is int) {
        phone = phoneValue;
      } else if (phoneValue is String) {
        phone = int.tryParse(phoneValue);
      } else if (phoneValue is double) {
        phone = phoneValue.toInt();
      }
    }

    address = json['subscriptionable']?['address'];
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
    data['subscriptionable_id'] = subscriptionableId;
    data['subscriptionable_type'] = subscriptionableType;
    data['subscription_to'] = subscriptionTo;
    data['subscription_from'] = subscriptionFrom;
    data['id'] = subscriptionId;
    data['subscriptionable'] = {'id': id};
    data['full_name'] = fullName;
    data['phone'] = phone;
    data['address'] = address;
    data['register_date'] = registerDate;
    return data;
  }
}
