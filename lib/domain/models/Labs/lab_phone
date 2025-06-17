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