import 'package:flutter_bloc/flutter_bloc.dart';

import '../Map/MapScreen.dart';
import '../Notifications/NotificationScreen.dart';
import '../profile/profileScreen.dart';
import '../situation/situationScreen.dart';
import '../weather/weatherScreen.dart';
import 'States.dart';
import 'package:flutter/material.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  static HomeCubit? get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  int currentIndex = 0;

  List<Widget> HomeScreens =const [
    WeatherScreen(),
    SituationScreen(),
    MapScreen(),
    NotificationScreen(),
    profileScreen(),
  ];

  changeScreen(int index) {
    currentIndex = index;
emit(HomeNavigationBarStates());
  }
}
