import 'package:app_final/view/Home/Notifications/widget/notificationsContianer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: white,
  platform: TargetPlatform.iOS,
  primaryColor: greenDark,
  primarySwatch: Colors.green,
  appBarTheme: const AppBarTheme(
      backgroundColor: white,
      toolbarHeight: 50,
      elevation: 0,

      centerTitle: true,
      iconTheme: IconThemeData(color: greenDark),
      titleTextStyle: TextStyle(
        color: greenDark,
        fontSize: 32,
        fontWeight: FontWeight.w500,
     ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: greenDark,
          statusBarIconBrightness: Brightness.light)),
);
