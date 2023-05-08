import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/Home/Notifications/cubit/States.dart';
import 'package:app_final/view/Home/Notifications/widget/notificationsContianer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/style/my_colors.dart';
import '../../../network/models/Notificationsmodel.dart';
import 'cubit/cubit.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsCubit()..getHasDiseases(),
      child: BlocConsumer<NotificationsCubit, NotificationsStates>(
        listener: (context, state) {
          print(state);
          // TODO: implement listener
        },
        builder: (context, state) {
          List<NotificationsModel>? notificationsModel =
              NotificationsCubit.get(context)?.notificationsModel;
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notifications",
                  style:
                      loginStyle.copyWith(fontSize: 30, color: AppColor.black),
                ),
                Divider(
                  color: AppColor.black,
                ),
                SizedBox(
                  height: 15,
                ),
                state is NotificationsLoadingtState
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        itemCount: notificationsModel!.length,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: AppColor.black,
                          );
                        },
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return NotificationsContainer(
                              title: notificationsModel[index]
                                  .notification!
                                  .title
                                  .toString(),
                              image: notificationsModel[index]
                                  .data!
                                  .value
                                  .toString(),
                              body: notificationsModel[index]
                                  .notification!
                                  .body
                                  .toString());
                        },
                      )
              ],
            ),
          ));
        },
      ),
    );
  }
}
