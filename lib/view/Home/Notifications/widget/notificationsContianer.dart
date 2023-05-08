import 'package:flutter/material.dart';

import '../../../../core/style/my_colors.dart';
import '../../../../core/style/my_style.dart';

class NotificationsContainer extends StatelessWidget {
  const NotificationsContainer(
      {Key? key, required this.title, required this.image, required this.body})
      : super(key: key);
  final String title;
  final String image;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColor.black,
                radius: 30,
                backgroundImage: NetworkImage(image),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Text(
                      title,
                      style: mediumStyle,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Text(
                      body,
                      maxLines: 2,
                      style: hintStyle2,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "10 Hrs ago.. ",
                style: hintStyle2,
              ),
            ],
          ),
        ));
  }
}
