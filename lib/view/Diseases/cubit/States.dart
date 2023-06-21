
import '../../../../network/models/user_model.dart';

abstract class DiseasesStates {}
class DiseasesInitialStates extends DiseasesStates{}

class DiseasesLoadingtState extends DiseasesStates{}
class DiseasesSuccessState extends DiseasesStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class DiseasesErrorState extends DiseasesStates{
  // final String? message;

  // MyTeamErrorState({required this.message});

}
class GetPhotoDiseasesLoadingtState extends DiseasesStates{}
class GetPhotoDiseasesSuccessState extends DiseasesStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class GetPhotoDiseasesErrorState extends DiseasesStates{
  // final String? message;

  // MyTeamErrorState({required this.message});

}
class GetDescriptionDiseasesLoadingtState extends DiseasesStates{}
class GetDescriptionDiseasesSuccessState extends DiseasesStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class GetDescriptionDiseasesErrorState extends DiseasesStates{
  // final String? message;

  // MyTeamErrorState({required this.message});

}