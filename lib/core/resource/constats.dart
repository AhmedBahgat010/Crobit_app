import '../../network/data_resources/local/shared_preferences.dart';
import '../../view/registration/Login/login.dart';
import 'navigator.dart';

dynamic token = '';
dynamic OnBoarding = '';
dynamic location = '';

void signout(context) {
  CacheHelper.removeToken(key: 'token').then((value) {
    navigateAndFinished(context, LoginScreen());
  });
}
