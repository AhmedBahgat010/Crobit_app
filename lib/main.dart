
import 'package:app_final/core/style/theme.dart';
import 'package:app_final/view/Home/HomeLayout.dart';
import 'package:app_final/view/registration/Login/login.dart';
import 'package:flutter/material.dart';
import 'network/data_resources/local/shared_preferences.dart';
import 'network/data_resources/remote/dio.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   await DioHelper.init();
await CacheHelper.init();
  final Widget startwidget;
 String token = CacheHelper.getData(key: 'token');
  if (token.isEmpty ) {
    startwidget = const HomeLayout();
  } else {
    startwidget = const LoginScreen();
  }
  runApp( MyApp(startwidget: startwidget,));
}

class MyApp extends StatelessWidget {
final Widget startwidget;
  const MyApp({ super.key, required this.startwidget, });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
theme: lightTheme,
debugShowCheckedModeBanner: false,
      home:LoginScreen(),
    );
  }
}

