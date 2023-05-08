import 'package:app_final/network/data_resources/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/app_strings.dart';
import '../../../../network/models/user_model.dart';
import 'States.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialStates());

  static LoginCubit? get(context) => BlocProvider.of(context);
  late UserModel loginModel;
  final formKey = GlobalKey<FormState>();

  void userLogin({
    required String? email,
    required String? password,
  }) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(LoginLoadingtState());
    formKey.currentState!.save();
    DioHelper.postdata(url:LOGIN, posteddata: {
      "email": email,
      "password": password,
    }).then((value) {
      loginModel = UserModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
      print("00000000000000000000000000000000000");
    }).catchError((error) {
      emit(LoginErrorState(message: error.toString()));
      print(error.toString());
      print("11111111111111111111111111111");
    });
  }
}
