

abstract class HomeStates {}
class HomeInitialStates extends HomeStates{}
class HomeNavigationBarStates extends HomeStates{}


class DiseasesLoadingtState extends HomeStates{}
class DiseasesSuccessState extends HomeStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class DiseasesErrorState extends HomeStates{
  // final String? message;

  // MyTeamErrorState({required this.message});

}
class GetPhotoDiseasesLoadingtState extends HomeStates{}
class GetPhotoDiseasesSuccessState extends HomeStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class GetPhotoDiseasesErrorState extends HomeStates{
  // final String? message;

  // MyTeamErrorState({required this.message});

}
class GetDescriptionDiseasesLoadingtState extends HomeStates{}
class GetDescriptionDiseasesSuccessState extends HomeStates{

  // late final MyTeamModel loginModel;
  // MyTeamSuccessState(this.loginModel);
}
class GetDescriptionDiseasesErrorState extends HomeStates{
  // final String? message;

  // MyTeamErrorState({required this.message});

}
class PostFcmTokenLoadingtState extends HomeStates{}
class PostFcmTokenSuccessState extends HomeStates{

}
class PostFcmTokenErrorState extends HomeStates{


}
