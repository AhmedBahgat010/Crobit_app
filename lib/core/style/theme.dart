import 'package:app_final/view/Home/Notifications/widget/notificationsContianer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.white,
  platform: TargetPlatform.iOS,
  primaryColor: AppColor.greenDark,
  primarySwatch: Colors.green,
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.white,
      toolbarHeight: 50,
      elevation: 0,

      centerTitle: true,
      iconTheme: IconThemeData(color: AppColor.greenDark),
      titleTextStyle: TextStyle(
        color: AppColor.greenDark,
        fontSize: 32,
        fontWeight: FontWeight.w500,
     ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.greenDark,
          statusBarIconBrightness: Brightness.light)),
);
