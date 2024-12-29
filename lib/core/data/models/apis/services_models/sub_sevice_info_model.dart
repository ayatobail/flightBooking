class SubServicesInfoModel {
  String? title;
  String? image;
  String? importantPapers;
  String? note;
  dynamic? marketerCost;
  dynamic? userCost;
  String? attachment;

  SubServicesInfoModel(
      {this.title,
        this.image,
        this.importantPapers,
        this.note,
        this.marketerCost,
        this.userCost,
        this.attachment});

  SubServicesInfoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    importantPapers = json['important_papers'];
    note = json['note'];
    marketerCost = json['marketer-cost'];
    userCost = json['user_cost'];
    attachment=json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['important_papers'] = this.importantPapers;
    data['note'] = this.note;
    data['marketer-cost'] = this.marketerCost;
    data['user_cost'] = this.userCost;
    data['attachment']=attachment;
    return data;
  }
}