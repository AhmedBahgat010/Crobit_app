class NotificationsModel {
  String? priority;
  Data? data;
  Notification? notification;


  NotificationsModel.fromJson(Map<String, dynamic> json) {
    priority = json['priority'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    notification = json['notification'] != null
        ? new Notification.fromJson(json['notification'])
        : null;
  }

}

class Data {
  String? key;
  String? value;


  Data.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }


}

class Notification {
  String? title;
  String? body;


  Notification.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }
}