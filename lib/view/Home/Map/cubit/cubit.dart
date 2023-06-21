import 'dart:ffi';
import 'dart:math';

import 'package:app_final/network/data_resources/remote/dio.dart';
import 'package:app_final/view/Home/Map/cubit/States.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import '../../../../core/resource/app_strings.dart';
import '../../../../core/resource/constats.dart';


class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(MapInitialStates());

  static MapCubit? get(context) => BlocProvider.of(context);

  void PostMaps({
    required List <Map<String,dynamic>?>? map,
  }){
  emit(MapLoadingtState());
    print(map);
      DioHelper.postdata(
      url: locations,
      posteddata: {
        "points": map

      },
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
        print("00000000000000000000000000000000000");

        emit(MapSuccessState());
    }).catchError((error) {
      emit(MapErrorState());
      print(error.toString());
    });
  }
}
