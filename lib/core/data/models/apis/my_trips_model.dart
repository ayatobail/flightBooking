class MyTripsModel {
  String? name;
  dynamic? cost;
  String? from;
  String? date;
  String? logo;
  String? destination;
  String? depatureDate;
  String? status;
  String? arrivalTime;
  String? depatureAirport;
  String? depatureTime;
  String? arrivalAirport;
  String? type;

  MyTripsModel(
      {this.name,
        this.cost,
        this.from,
        this.date,
        this.logo,
        this.destination,
        this.depatureDate,
        this.status,
        this.arrivalTime,
        this.depatureAirport,
        this.depatureTime,
        this.arrivalAirport,
        this.type});

  MyTripsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cost = json['cost'];
    from = json['from'];
    date = json['date'];
    logo = json['logo'];
    destination = json['destination'];
    depatureDate = json['depature_date'];
    status = json['status'];
    arrivalTime = json['arrival_time'];
    depatureAirport = json['depature_airport'];
    depatureTime = json['depature_time'];
    arrivalAirport = json['arrival_airport'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cost'] = this.cost;
    data['from'] = this.from;
    data['date'] = this.date;
    data['logo'] = this.logo;
    data['destination'] = this.destination;
    data['depature_date'] = this.depatureDate;
    data['status'] = this.status;
    data['arrival_time'] = this.arrivalTime;
    data['depature_airport'] = this.depatureAirport;
    data['depature_time'] = this.depatureTime;
    data['arrival_airport'] = this.arrivalAirport;
    data['type'] = this.type;
    return data;
  }
}