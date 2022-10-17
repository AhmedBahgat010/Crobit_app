
import '../../../../network/models/user_model.dart';

abstract class RegisterStates {}
class RegisterInitialStates extends RegisterStates{}
class RegisterLoadingtState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{

  late final LoginModel loginModel;
  RegisterSuccessState(this.loginModel);
}
class RegisterErrorState extends RegisterStates{
  final String? message;

  RegisterErrorState({required this.message});

}