import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'my_colors.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor:white,
  platform: TargetPlatform.iOS,
  primaryColor: greenDark,
  primarySwatch: Colors.green,
  appBarTheme: const AppBarTheme(
    backgroundColor: white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: greenDark),
    titleTextStyle: TextStyle(color:greenDark, fontSize: 22, fontWeight: FontWeight.w400),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: greenDark,
      statusBarIconBrightness: Brightness.dark
    )
  ),
);
