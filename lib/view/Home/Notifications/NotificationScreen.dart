import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/Home/Notifications/widget/notificationsContianer.dart';
import 'package:flutter/material.dart';

import '../../../core/style/my_colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(

              children: const [
                SizedBox(height: 30,),
            NotificationsContainer(),
            NotificationsContainer(),
            NotificationsContainer(),
            NotificationsContainer(),
            NotificationsContainer(),     NotificationsContainer(),
            NotificationsContainer(),
            NotificationsContainer(),     NotificationsContainer(),
            NotificationsContainer(),
            NotificationsContainer(),     NotificationsContainer(),
            NotificationsContainer(),
            NotificationsContainer(),     NotificationsContainer(),
            NotificationsContainer(),
            NotificationsContainer(),

          ]),
        )));
  }
}
