class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  bool? status;
  String? token;
  String? expireDate;
  String? username;
  String? email;

  Data(
      {this.firstName,
        this.lastName,
        this.status,
        this.token,
        this.expireDate,
        this.username,
        this.email});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    status = json['status'];
    token = json['token'];
    expireDate = json['expireDate'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['status'] = this.status;
    data['token'] = this.token;
    data['expireDate'] = this.expireDate;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}
