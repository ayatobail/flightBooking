class NotificationModel {
  String? id;
  String? title;
  String? body;
  String? time;
  bool? seen;

  NotificationModel({this.id, this.title, this.body,this.time,this.seen});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    time=json['time'];
    seen=json['seen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['time']=this.time;
    data['seen']=this.seen;
    return data;
  }
}
