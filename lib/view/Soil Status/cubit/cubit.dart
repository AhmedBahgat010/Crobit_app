import 'package:app_final/network/data_resources/remote/dio.dart';
import 'package:app_final/network/models/SoilStatusModel.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import '../../../../core/resource/app_strings.dart';
import '../../../core/resource/constats.dart';
import 'States.dart';
import 'package:flutter/material.dart';
import 'package:polymaker/polymaker.dart' as polymaker;

class SoilStatusCubit extends Cubit<SoilStatusStates> {
  SoilStatusCubit() : super(SoilStatusInitialStates());

  static SoilStatusCubit? get(context) => BlocProvider.of(context);
  List<SoilStatusModel> diseasesModel = [];

  getHasSoilStatus() {
    print("objectobjectobjectobjectobjectobjectobject");
    emit(SoilStatusLoadingtState());
    DioHelper.getdata(
      url: Status,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      print(value);
      (value.data as List).map((e) {
        diseasesModel.add(SoilStatusModel.fromJson(e));
      }).toList();
      print(diseasesModel);
      emit(SoilStatusSuccessState());
    }).catchError((error) {
      print(error);
      emit(SoilStatusErrorState());
    });
  }
}
