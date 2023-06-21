
import '../../../../network/models/user_model.dart';

abstract class SoilStatusStates {}
class SoilStatusInitialStates extends SoilStatusStates{}

class SoilStatusLoadingtState extends SoilStatusStates{}
class SoilStatusSuccessState extends SoilStatusStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class SoilStatusErrorState extends SoilStatusStates{
  // final String? message;

  // MyTeamErrorState({required this.message});

}
class GetPhotoSoilStatusLoadingtState extends SoilStatusStates{}
class GetPhotoSoilStatusSuccessState extends SoilStatusStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class GetPhotoSoilStatusErrorState extends SoilStatusStates{
  // final String? message;

  // MyTeamErrorState({required this.message});

}
class GetDescriptionSoilStatusLoadingtState extends SoilStatusStates{}
class GetDescriptionSoilStatusSuccessState extends SoilStatusStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class GetDescriptionSoilStatusErrorState extends SoilStatusStates{
  // final String? message;

  // MyTeamErrorState({required this.message});

}