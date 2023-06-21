part of 'profil_cubit.dart';

@immutable
abstract class ProfilState {}

class ProfilInitial extends ProfilState {}
class ProfilLoadingtState extends ProfilState{}
class ProfilSuccessState extends ProfilState{

  // late final ProfilModel loginModel;
  // ProfilSuccessState(this.loginModel);
}
class ProfilErrorState extends ProfilState{
  // final String message;
  //
  // ProfilErrorState({required this.message});

}class EditProfilLoadingtState extends ProfilState{}
class EditProfilSuccessState extends ProfilState{

  // late final ProfilModel loginModel;
  // ProfilSuccessState(this.loginModel);
}
class EditProfilErrorState extends ProfilState{
  // final String message;
  //
  // ProfilErrorState({required this.message});

}

