import 'package:app_final/core/components/button_registration.dart';
import 'package:app_final/core/resource/navigator.dart';
import 'package:flutter/material.dart';

import '../../network/data_resources/local/shared_preferences.dart';
import '../registration/Login/login.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ButtonSign(
        ontap: () {
          CacheHelper.removeToken(key: 'token').then((value) {
            navigateAndFinished(context, LoginScreen());
          });
        },
        text: "sign out",
      )),
    );
  }
}
