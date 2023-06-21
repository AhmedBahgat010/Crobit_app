import 'package:app_final/view/Home/Notifications/widget/notificationsContianer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.white,
  platform: TargetPlatform.iOS,
  primaryColor: AppColor.greenDark,
  canvasColor: Colors.transparent,

  primarySwatch: Colors.green,
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.white,
      toolbarHeight: 50,
      elevation: 0,

      centerTitle: true,
      iconTheme: IconThemeData(color: AppColor.greenDark),
      titleTextStyle: TextStyle(
        color: AppColor.greenDark,
        fontSize: 28,
        fontWeight: FontWeight.w500,
     ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.greenDark,
          statusBarIconBrightness: Brightness.light)),
);
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.dark(),
  iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),  platform: TargetPlatform.iOS,
  primarySwatch: Colors.green,
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.white,
      toolbarHeight: 50,
      elevation: 0,

      centerTitle: true,
      iconTheme: IconThemeData(color: AppColor.greenDark),
      titleTextStyle: TextStyle(
        color: AppColor.greenDark,
        fontSize: 28,
        fontWeight: FontWeight.w500,
     ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.greenDark,
          statusBarIconBrightness: Brightness.light)),
);
