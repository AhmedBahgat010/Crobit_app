import 'package:app_final/network/data_resources/remote/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/app_strings.dart';
import '../../../../network/models/user_model.dart';
import 'States.dart';
import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialStates());

  static RegisterCubit? get(context) => BlocProvider.of(context);
  late UserModel RegisterModel;
  final formKey = GlobalKey<FormState>();

  void userRegister({
    required String? name,
    required String? email,
    required String? phone,
    required String? password,
  }) {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    emit(RegisterLoadingtState());
    formKey.currentState!.save();
    DioHelper.postdata(url:REGISTER,
        posteddata: {
        "email":email,
        "userName":name,
        "password": password,


    }).then((value) {
      RegisterModel = UserModel.fromJson(value.data);
      emit(RegisterSuccessState());

    }).catchError((error) {

      emit(RegisterErrorState(message: error.toString()));

      print(error);
      print(password);
      print(phone);
      print(email);

    });
  }
}
