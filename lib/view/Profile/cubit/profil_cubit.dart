import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/resource/app_strings.dart';
import '../../../core/resource/constats.dart';
import '../../../network/data_resources/local/shared_preferences.dart';
import '../../../network/data_resources/remote/dio.dart';
import '../../../network/models/UserModel.dart';

part 'profil_state.dart';

class ProfilCubit extends Cubit<ProfilState> {
  ProfilCubit() : super(ProfilInitial());

  static ProfilCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  void getProfil() {
    emit(ProfilLoadingtState());
    DioHelper.getdata(
      url: UserData,
      headers: {
        'Accept': 'application/json',
        'Authorization': "Bearer ${token}",
      },
    ).then((value) {
      print(value);
      print("valuevaluevaluevaluevalue");
      userModel = UserModel.fromJson(value.data);
print(userModel);
      // CacheHelper.saveData(
      //     key: 'location',
      //     value: "${userModel!.point!.lan} ,${userModel!.point!.long}");
      location = CacheHelper.getData(key: 'location');

      emit(ProfilSuccessState());

      print("team_id");
    });
  }
}
