// class LoginModel
// {
//    bool status;
//    String message;
//   UserData? data;
//
//   LoginModel.fromJson(Map<String,dynamic> jsonModel)
//   {
//     status=jsonModel['status'];
//     message=jsonModel['message'];
//     data = jsonModel['data'] != null ? UserData.fromJson(jsonModel['data']) : null;
//   }
// }
//
//
// class UserData
// {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? image;
//   int? points;
//   int? credits;
//   String? token;
//
//   UserData.fromJson(Map<String,dynamic> jsonModel)
//   {
//     id=jsonModel['id'];
//     name=jsonModel['name'];
//     email=jsonModel['email'];
//     phone=jsonModel['phone'];
//     image=jsonModel['image'];
//     points=jsonModel['points'];
//     credits=jsonModel['credits'];
//     token=jsonModel['token'];
//   }
// }




class UserModel {
   bool? status;
   String? token;
   String? expireDate;
   String? username;
   String? email;
   // String? message;

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    expireDate = json['expireDate'];
    username = json['username'];
    email = json['email'];
    // message = json['description'];


  }

}