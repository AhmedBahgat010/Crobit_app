import 'package:app_final/core/style/theme.dart';
import 'package:app_final/view/Home/Home/cubit/cubit.dart';
import 'package:app_final/view/Home/HomeLayout.dart';
import 'package:app_final/view/registration/Login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'core/resource/constats.dart';
import 'network/data_resources/local/shared_preferences.dart';
import 'network/data_resources/remote/dio.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DioHelper.init();
  await CacheHelper.init();
  final Widget startWidget;
  token = CacheHelper.getData(key: 'token');

  if (token != null) {
    if (token != null)
      startWidget = HomeLayout();
    else
      startWidget = LoginScreen();
  } else {
    startWidget = const LoginScreen();
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => HomeCubit()
              ..notification(
                  channel, context, flutterLocalNotificationsPlugin)..PostFcmToken()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: startwidget,
      ),
    );
  }
}
