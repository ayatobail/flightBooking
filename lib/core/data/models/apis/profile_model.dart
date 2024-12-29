class ProfileModel {
  String? name;
  String? mobilePhone;

  ProfileModel({this.name, this.mobilePhone});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobilePhone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.mobilePhone;
    return data;
  }
}
