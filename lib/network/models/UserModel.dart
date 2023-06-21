class UserModel {
  String? name;
  String? email;
  Point? point;

  UserModel({this.name, this.email, this.point});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    point = json['point'] != null ? new Point.fromJson(json['point']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.point != null) {
      data['point'] = this.point!.toJson();
    }
    return data;
  }
}

class Point {
  int? id;
  double? lan;
  double? long;
  int? locationID;

  Point({this.id, this.lan, this.long, this.locationID});

  Point.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lan = json['lan'];
    long = json['long'];
    locationID = json['locationID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lan'] = this.lan;
    data['long'] = this.long;
    data['locationID'] = this.locationID;
    return data;
  }
}