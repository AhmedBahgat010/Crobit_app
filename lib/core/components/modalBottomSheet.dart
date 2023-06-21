import 'package:app_final/core/components/button_registration.dart';
import 'package:app_final/core/resource/constats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import '../style/my_colors.dart';
import '../style/my_style.dart';
import 'DefaultFormField.dart';

modalBottomSheet(context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        // using a scaffold helps to more easily position the FAB
        return Container(
          height: 200,
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.maxFinite,
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Logout",
                  style: labelStyle2,
                ),
              ),
              Divider(
                color: AppColor.black,
                height: 5,
              ),
              Text(
                "Are You Sure you want to logout? ",
                style: mediumStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                      color: AppColor.lightGray,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: mediumStyle.copyWith(color: AppColor.gray),
                      ),
                    ),
                  ),
                  ),
                  InkWell(
                    onTap: () {
signout(context);
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: AppColor.lightGray,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Yes, Logout",
                          style: mediumStyle.copyWith(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          // translate the FAB up by 30

          // dock it to the center top (from which it is translated)
        );
      });
}
showDialogRate(context ,TextEditingController controller, Function(double) onRatingUpdate) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.white,
          title: const Center(child: Text('Rate Us')),
          titleTextStyle: TextLoginButton,


          //titlePadding: const EdgeInsets.symmetric(vertical: 20),
          // elevation: 10,
          insetPadding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                //color: AppColors.pink,
              ),
              borderRadius: BorderRadius.all(
                  Radius.circular(15))),
          content: SizedBox(
              height: 100,

            child: Column(children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: RatingBar.builder(
                      textDirection: TextDirection.rtl,
                      initialRating: 1,
                      minRating: 1,
                      itemSize: 30,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding:
                      const EdgeInsets.symmetric(horizontal: 2),
                      itemBuilder: (context, _) =>
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: onRatingUpdate
                    ),
                  ),
                ],
              ),
              DefaultFormField(

                hintText: 'write something here.',
                controller: controller,
              ),
            ],

            ),
          ),
          actions: <Widget>[
            Center(
              child: ButtonSign(
                ontap:(){} ,
                width: 100,
                text: 'Done',
              ),
            ),
          ],
        );
      });
}


