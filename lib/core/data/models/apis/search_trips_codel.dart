class SearchModel {
  dynamic? total;
  dynamic? secondePrices;
  String? depaturairportename;
  String? arivalairportename;
  String? arrivalTime;
  String? departureTime;
  int? totalTime;
  String? nameairline;
  String? logo;
  String? currencyCode;
  ReturnFlights? returnFlights;

  SearchModel(
      {this.total,
        this.secondePrices,
        this.depaturairportename,
        this.arivalairportename,
        this.arrivalTime,
        this.departureTime,
        this.totalTime,
        this.nameairline,
        this.logo,
        this.currencyCode,
        this.returnFlights});

  SearchModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    secondePrices = json['SecondePrices'];
    depaturairportename = json['depaturairportename'];
    arivalairportename = json['arivalairportename'];
    arrivalTime = json['arrivalTime'];
    departureTime = json['departureTime'];
    totalTime = json['totalTime'];
    nameairline = json['nameairline'];
    logo = json['logo'];
    currencyCode = json['currencyCode'];
    returnFlights = json['return_flights'] != null
        ? new ReturnFlights.fromJson(json['return_flights'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['SecondePrices'] = this.secondePrices;
    data['depaturairportename'] = this.depaturairportename;
    data['arivalairportename'] = this.arivalairportename;
    data['arrivalTime'] = this.arrivalTime;
    data['departureTime'] = this.departureTime;
    data['totalTime'] = this.totalTime;
    data['nameairline'] = this.nameairline;
    data['logo'] = this.logo;
    data['currencyCode'] = this.currencyCode;
    if (this.returnFlights != null) {
      data['return_flights'] = this.returnFlights!.toJson();
    }
    return data;
  }
}

class ReturnFlights {
  String? departureTime;
  String? arrivaltime;

  ReturnFlights({this.departureTime, this.arrivaltime});

  ReturnFlights.fromJson(Map<String, dynamic> json) {
    departureTime = json['departureTime'];
    arrivaltime = json['arrivaltime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departureTime'] = this.departureTime;
    data['arrivaltime'] = this.arrivaltime;
    return data;
  }
}