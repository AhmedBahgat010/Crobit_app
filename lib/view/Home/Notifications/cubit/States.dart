
import '../../../../network/models/user_model.dart';

abstract class NotificationsStates {}
class NotificationsInitialStates extends NotificationsStates{}
class NotificationsLoadingtState extends NotificationsStates{}
class NotificationsSuccessState extends NotificationsStates{


}
class NotificationsErrorState extends NotificationsStates{
  // final String? message;
  //
  // NotificationsErrorState({required this.message}

      // );

}