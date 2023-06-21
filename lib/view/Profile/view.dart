import 'package:app_final/core/components/modalBottomSheet.dart';
import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/Profile/cubit/profil_cubit.dart';
import 'package:app_final/view/Profile/cubit/profil_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilCubit , ProfilState>(
      listener: (context, state) {
        // TODO: implement listener
        print(state);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/logo.png"),
                          radius: 50,
                        )),
                    Text(
                      "Ali Mohamed",
                      style: hintStyle.apply(color: AppColor.black),
                    ),
                    Text("+039828288282"),
                    SizedBox(
                      height: 30,
                    ),
                    ContainerProfile(
                      text: "My Account",
                      icon: Icon(
                        Icons.person_2_outlined,
                        color: AppColor.greenDark,
                        size: 35,
                      ),
                      iconeBool: true,
                      ontap: () {},
                    ),
                    ContainerProfile(
                      text: "Privacy Policy",
                      icon: Icon(
                        Icons.privacy_tip_outlined,
                        color: AppColor.greenDark,
                        size: 35,
                      ),
                      iconeBool: true,
                      ontap: () {},
                    ),
                    ContainerProfile(
                        text: "My Fields",
                        iconeBool: true,
                        ontap: () {},
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/img_6.png",
                          ),
                        )),
                    ContainerProfile(
                      text: "Dark Mode",
                      icon: Icon(
                        Icons.dark_mode_outlined,
                        color: AppColor.greenDark,
                        size: 35,
                      ),
                      iconeBool: false,
                    ),
                    ContainerProfile(
                      text: "Help Center",
                      icon: Icon(
                        Icons.help_outline_sharp,
                        color: AppColor.greenDark,
                        size: 35,
                      ),
                      iconeBool: true,
                      ontap: () {},
                    ),
                    ContainerProfile(
                      text: "Rate Us",
                      icon: Icon(
                        Icons.star_border,
                        color: AppColor.greenDark,
                        size: 35,
                      ),
                      iconeBool: true,
                      ontap: () {
                        showDialogRate(context, controller, (rating) {
                          setState(() {
                            // showRating = rating;
                          });
                        },);
                      },
                    ),
                    ContainerProfile(
                      text: "Log Out",
                      icon: Icon(
                        Icons.output,
                        color: AppColor.greenDark,
                        size: 35,
                      ),
                      iconeBool: true,
                      ontap: () {
                        modalBottomSheet(context);
                      },
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}

class ContainerProfile extends StatefulWidget {
  ContainerProfile({
    Key? key,
    required this.text,
    required this.iconeBool,
    required this.icon,
    this.ontap,
  }) : super(key: key);
  final String text;
  final Widget icon;
  final bool iconeBool;

  final Function()? ontap;

  bool status = false;

  @override
  State<ContainerProfile> createState() => _ContainerProfileState();
}

class _ContainerProfileState extends State<ContainerProfile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5.0,
            spreadRadius: 7,
            offset: Offset(
              2.0, // horizontal, move right 10
              3.0, // vertical, move down 10
            ),
          )
        ], color: AppColor.white, borderRadius: BorderRadius.circular(15)),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: AppColor.colorNotifications,
                  borderRadius: BorderRadius.circular(15)),
              child: widget.icon),
          SizedBox(
            width: 20,
          ),
          Text(
            widget.text,
            style: hintStyle.copyWith(color: AppColor.black),
          ),
          Spacer(),
          widget.iconeBool == true
              ? Directionality(
            textDirection: TextDirection.rtl,
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppColor.greenDark,
              size: 30,
            ),
          )
              : Container(
            child: FlutterSwitch(
              width: 70.0,
              height: 30.0,
              toggleSize: 30.0,
              value: widget.status,
              borderRadius: 30.0,
              padding: 3.0,
              activeColor: Color(0xff93DCEC),
              inactiveColor: Color(0xE0BCBCBC),
              inactiveTextColor: AppColor.white,
              showOnOff: true,
              onToggle: (val) {
                setState(() {
                  widget.status = val;
                });
              },
            ),
          ),
        ]),
      ),
    );
  }
}
