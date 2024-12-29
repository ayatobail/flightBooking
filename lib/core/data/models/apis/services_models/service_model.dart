class ServiceModel {
  int? id;
  String? type;

  ServiceModel({this.id, this.type, });

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['service-id'];
    type = json['service-type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;

    return data;
  }
}


