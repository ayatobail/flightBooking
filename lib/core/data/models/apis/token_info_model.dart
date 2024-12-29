class TokenInfoModel {
  String? token;
  int? id;
  String? name;
  String? email;
  dynamic? phone;
  String? role;

  TokenInfoModel({this.token,this.id,this.role,this.name,this.phone,this.email});

  TokenInfoModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id=json['id'];
    role=json['role'];
    name=json['name'];
    phone=json['phone'];
    email=json['email'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id']=this.id;
    data['role']=this.role;
    data['name']=this.name;
    data['phone']=this.phone;
    data['email']=this.email;
    return data;
  }
}
