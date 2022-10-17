import 'package:app_final/network/data_resources/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/app_strings.dart';
import '../../../../network/models/user_model.dart';
import 'States.dart';
import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit? get(context) => BlocProvider.of(context);
  late LoginModel loginModel;
  final formKey = GlobalKey<FormState>();

  void userRegister({
    required String? name,
    required String? email,
    required String? phone,
    required String? password,
  }) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(RegisterLoadingtState());
    formKey.currentState!.save();
    DioHelper.postData(url:REGISTER, data: {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);

      emit(RegisterSuccessState(loginModel));
      print("00000000000000000000000000000000000");
    }).catchError((error) {
      emit(RegisterErrorState(message: error.toString()));
      print(error.toString());
      print("11111111111111111111111111111");
    });
  }
}
