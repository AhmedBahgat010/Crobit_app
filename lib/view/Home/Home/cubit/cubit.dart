import 'package:app_final/core/resource/app_strings.dart';
import 'package:app_final/core/resource/constats.dart';
import 'package:app_final/network/data_resources/remote/dio.dart';
import 'package:app_final/view/Home/Home/weatherScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../../network/models/DiseasesModel.dart';
import '../../Consultant/Chat.dart';
import '../../Map/MapScreen.dart';
import '../../Notifications/NotificationScreen.dart';
import 'States.dart';
import 'package:flutter/material.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  static HomeCubit? get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  int currentIndex = 0;

  List<Widget> HomeScreens = const [
    HomeScreen(),
    MapScreen(),
    ConsultantChat(),

    NotificationScreen(),
  ];

  changeScreen(int index) {
    currentIndex = index;
    emit(HomeNavigationBarStates());
  }

  List<HasDiseasesModel> diseasesModel = [];

  getHasDiseases() {
    emit(DiseasesLoadingtState());
    DioHelper.getdata(
      url: HasDiseases,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      (value.data as List).map((e) {
        diseasesModel.add(HasDiseasesModel.fromJson(e));
        print(e["photoId"]);
      }).toList();
      emit(DiseasesSuccessState());
    }).catchError((error) {
      print(error);
      emit(DiseasesErrorState());
    });
  }

  PhotoDiseasesModel? photoDiseasesModel;

  DescriptionDiseasesModel? descriptionDiseasesModel;

  getPhotoDiseases(id) {
    emit(GetPhotoDiseasesLoadingtState());
    DioHelper.getdata(
      url: PhotoDiseases + "${id}",
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      photoDiseasesModel = PhotoDiseasesModel.fromJson(value.data);

      emit(GetPhotoDiseasesSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetPhotoDiseasesErrorState());
    });
  }

  getDescriptionDiseases(id) {
    emit(GetDescriptionDiseasesLoadingtState());
    DioHelper.getdata(
      url: DescriptionDiseases + "${id}",
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      descriptionDiseasesModel = DescriptionDiseasesModel.fromJson(value.data);

      emit(GetDescriptionDiseasesSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetDescriptionDiseasesErrorState());
    });
  }

  notification(AndroidNotificationChannel channel, context,
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

 PostFcmToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
    print(fcmToken);
    emit(PostFcmTokenLoadingtState());
    DioHelper.postdata(
      url: FcmToken,
      query: {
        "deviceToken":fcmToken
      },
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      emit(PostFcmTokenSuccessState());
    }).catchError((error) {
      emit(PostFcmTokenErrorState());
      print(error.toString());
    });
  }
}
