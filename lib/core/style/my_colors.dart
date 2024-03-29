import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 class AppColor{
  static const Color  green = Color(0xffBEE3CB);
  static const Color  colorNotifications = Color(0xffDFF2E5);
  static const Color  greenDark = Color(0xff4BA26A);
  static const Color  white = Colors.white;
  static const  Color black = Color(0xff1d1d1d);
  static const Color gray = Color(0xff7c7c7c);
  static const Color lightGray = Color(0xffc7c7c7);
  final Shader shader = const LinearGradient(
    colors: <Color>[Color(0xffBEE3CB), Color(0xff4BA26A)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  }

