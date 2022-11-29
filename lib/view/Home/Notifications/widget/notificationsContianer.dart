
import 'package:flutter/material.dart';

import '../../../../core/style/my_colors.dart';
import '../../../../core/style/my_style.dart';
class NotificationsContainer extends StatelessWidget {
  const NotificationsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             Container(
        margin: const EdgeInsets.only(top: 2, bottom: 4),
        color: colorNotifications,
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: black,
                radius: 5,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "There is an insect in your crop.",
                    style: mediumStyle,
                  ),
                  Text(
                    "2 hours ago",
                    style: hintStyle2,
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: greenDark,
                radius: 7,
              ),
            ],
          ),
        ))
    ;
  }
}
