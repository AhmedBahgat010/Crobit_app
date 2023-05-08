import 'package:app_final/network/data_resources/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resource/app_strings.dart';
import '../../../../core/resource/constats.dart';
import '../../../../network/models/Notificationsmodel.dart';
import '../../../../network/models/user_model.dart';
import 'States.dart';
import 'package:flutter/material.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit() : super(NotificationsInitialStates());

  static NotificationsCubit? get(context) => BlocProvider.of(context);
  late List<NotificationsModel> notificationsModel=[];


  getHasDiseases() {
    emit(NotificationsLoadingtState());
    DioHelper.getdata(
      url: Notifications,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      (value.data as List).map((e) {
        notificationsModel.add(NotificationsModel.fromJson(e));
      }).toList();
      emit(NotificationsSuccessState());
    }).catchError((error) {
      print(error);
      emit(NotificationsErrorState());
    });
  }
}
