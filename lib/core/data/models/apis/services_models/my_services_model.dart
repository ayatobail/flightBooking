class MyServicesModel {
  String? userName;
  String? passportnum;
  String? requestStatus;
  String? subserviceType;
  String? suriceType;
  String? email;
  String? description;
  dynamic? userCost;
  dynamic? marketerCost;
  String? image;

  MyServicesModel(
      {this.userName,
        this.passportnum,
        this.requestStatus,
        this.subserviceType,
        this.suriceType,
        this.email,
        this.description,
        this.userCost,
        this.marketerCost,
      this.image});

  MyServicesModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    passportnum = json['passportnum'];
    requestStatus = json['requestStatus'];
    subserviceType = json['subservice_type'];
    suriceType = json['surice_type'];
    email = json['email'];
    description = json['description'];
    userCost = json['user_cost'];
    marketerCost = json['marketer_cost'];
    image=json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['passportnum'] = this.passportnum;
    data['requestStatus'] = this.requestStatus;
    data['subservice_type'] = this.subserviceType;
    data['surice_type'] = this.suriceType;
    data['email'] = this.email;
    data['description'] = this.description;
    data['user_cost'] = this.userCost;
    data['marketer_cost'] = this.marketerCost;
    data['image']=this.image;
    return data;
  }
}