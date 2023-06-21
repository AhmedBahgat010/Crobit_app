import 'package:app_final/network/data_resources/remote/dio.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import '../../../../core/resource/app_strings.dart';
import '../../../core/resource/constats.dart';
import '../../../network/models/DiseasesModel.dart';
import 'States.dart';
import 'package:flutter/material.dart';
import 'package:polymaker/polymaker.dart' as polymaker;

class DiseasesCubit extends Cubit<DiseasesStates> {
  DiseasesCubit() : super(DiseasesInitialStates());

  static DiseasesCubit? get(context) => BlocProvider.of(context);
  List<HasDiseasesModel> diseasesModel = [];

  getHasDiseases(String Diseases) {
    emit(DiseasesLoadingtState());
    DioHelper.getdata(
      url: Diseases,
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      (value.data as List).map((e) {
        diseasesModel.add(HasDiseasesModel.fromJson(e));
      }).toList();
      emit(DiseasesSuccessState());
    }).catchError((error) {
      print(error);
      emit(DiseasesErrorState());
    });
  }
}
