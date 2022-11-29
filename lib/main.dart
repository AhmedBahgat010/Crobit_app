import 'package:app_final/core/style/theme.dart';
import 'package:app_final/view/Home/HomeLayout.dart';
import 'package:app_final/view/Home/cubit/cubit.dart';
import 'package:app_final/view/registration/Login/login.dart';
import 'package:app_final/view/welcamScreen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/resource/constats.dart';
import 'network/data_resources/local/shared_preferences.dart';
import 'network/data_resources/remote/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  final Widget startWidget;
  token = CacheHelper.getData(key: 'token');
  if (token != null) {
    if (token != null) startWidget = HomeLayout();
    else startWidget = LoginScreen();
  } else {
    startWidget = const LoginScreen();
  }
  runApp(MyApp(
    startwidget: startWidget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startwidget;

  const MyApp({
    super.key,
    required this.startwidget,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return HomeCubit();
      },
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: HomeLayout(),
      ),
    );
  }
}
