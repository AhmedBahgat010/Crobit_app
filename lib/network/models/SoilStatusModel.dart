class SoilStatusModel {
  int? id;
  String? date;
  double? humidity;
  double? waterLevel;
  double? n;
  double? p;
  double? k;
  double? ph;
  double? heat;
  double? lan;
  double? long;

  SoilStatusModel(
      {this.id,
        this.date,
        this.humidity,
        this.waterLevel,
        this.n,
        this.p,
        this.k,
        this.ph,
        this.heat,
        this.lan,
        this.long});

  SoilStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    humidity = json['humidity'];
    waterLevel = json['waterLevel'];
    n = json['n'];
    p = json['p'];
    k = json['k'];
    ph = json['ph'];
    heat = json['heat'];
    lan = json['lan'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['humidity'] = this.humidity;
    data['waterLevel'] = this.waterLevel;
    data['n'] = this.n;
    data['p'] = this.p;
    data['k'] = this.k;
    data['ph'] = this.ph;
    data['heat'] = this.heat;
    data['lan'] = this.lan;
    data['long'] = this.long;
    return data;
  }
}