import 'package:app_final/core/resource/constats.dart';
import 'package:app_final/core/resource/navigator.dart';
import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/view/Diseases/DiseasesScreen.dart';
import 'package:app_final/view/Diseases/ScreenAllDiseases.dart';
import 'package:app_final/view/Home/Consultant/chatbot/Chatbot.dart';
import 'package:app_final/view/Home/Home/cubit/cubit.dart';
import 'package:app_final/view/Home/Home/weatherContainer.dart';
import 'package:app_final/view/Profile/cubit/profil_cubit.dart';
import 'package:app_final/view/Profile/view.dart';
import 'package:app_final/view/Select%20your%20crop/Selectcrop.dart';
import 'package:app_final/view/Soil%20Status/soilstatus.dart';
import 'package:app_final/view/Water_Control/view.dart';
import 'package:app_final/view/hardware_number/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import '../../../core/style/my_style.dart';
import 'Containe_features.dart';
import 'cubit/States.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
          toolbarHeight: 60,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                onTap: () {
                  navigateTo(context, ProfileScreen());
                },
                child: CircleAvatar(
                    backgroundColor: AppColor.greenDark,
                    radius: 18,
                    child: Icon(
                      Icons.person,size: 30,
                      color: AppColor.white
                    )),
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Image.asset(
              "assets/images/logo.png",
              color: AppColor.greenDark,
            ),
          )),

      resizeToAvoidBottomInset: false, //new line
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          print(state);
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeatherContainer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColor.green,
                          borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                        CircleAvatar(
                          backgroundColor: AppColor.white,
                          radius: 20,
                          child: Image.asset("assets/images/img_5.png",
                              height: 30),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Add Crop",
                            style: labelStyle.apply(color: AppColor.greenDark)),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            navigateTo(context, SelectYourCrop());
                          },
                          child: Container(
                            height: 35,
                            width: 45,
                            child: Center(
                                child: Icon(
                              Icons.navigate_next,
                              color: AppColor.greenDark,
                              size: 40,
                            )),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Main Features",
                        style: labelStyle2,
                      ),
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        containerModel.length,
                        (index) => ContainerFeatures(
                          image: containerModel[index].image,
                          title: containerModel[index].title,
                          buttontitle: containerModel[index].buttontitle,
                          ontap: () {
                            navigateTo(context, containerModel[index].ontap);
                            print("1010");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContainerModel {
  final String image;
  final String title;
  final String buttontitle;

  final ontap;

  ContainerModel({
    required this.image,
    required this.title,
    required this.ontap,
    required this.buttontitle,
  });
}

List<ContainerModel> containerModel = [
  ContainerModel(
    ontap: AllDiseasesScreen(),
    // ontap: DiseasesScreen(),
    image: 'assets/images/Diagnoseyourcrop.png',
    title: 'Diagnose your crop',
    buttontitle: 'Diagnose Diseases',
  ),
  ContainerModel(
    ontap: SoilStatus(),
    image: 'assets/images/img_6.png',
    title: 'Follow your soil statuss',
    buttontitle: 'Soil Status',
  ),
  ContainerModel(
    ontap: WaterControl(),
    image: 'assets/images/img_9.png',
    title: 'Control and save water',
    buttontitle: 'Irrigation Control',
  ),
  ContainerModel(
    ontap: SoilStatus(),
    image: 'assets/images/img_8.png',
    title: 'Monitoring your crop ',
    buttontitle: 'Satellite Monitoring',
  ),
  ContainerModel(
    ontap: ChatBot(),
    image: 'assets/images/img_10.png',
    title: 'Ask for anything you want',
    buttontitle: 'Consultant',
  ),
  ContainerModel(
    ontap: HardWare_Number(),
    image: 'assets/images/img_7.png',
    title: 'Scan your crop',
    buttontitle: 'Scan Crop',
  ),
];

// class _SliderView extends StatelessWidget {
//   final Function(String)? onItemClick;
//
//   const _SliderView({Key? key, this.onItemClick}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.only(top: 30),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               width: double.infinity,
//               height: 100,
//               color: AppColor.white,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: AppColor.black,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         " ",
//                         // " ${userModel!.token.toString()}",
//                         style: mediumStyle,
//                       ),
//                       Text(
//                         "amoh@gmail.com",
//                         style: hintStyle2,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             _SliderMenuItem(
//                 title: 'Home',
//                 iconData: Icons.home,
//                 onTap: () {
//                   navigateTo(context, ChatBot());
//                 }),
//             _SliderMenuItem(
//                 title: 'profile', iconData: Icons.person, onTap: () {}),
//             _SliderMenuItem(
//                 title: 'Notification',
//                 iconData: Icons.notifications_active,
//                 onTap: () {}),
//             _SliderMenuItem(
//                 title: 'Dark Mode', iconData: Icons.dark_mode, onTap: () {}),
//             _SliderMenuItem(
//                 title: 'Hardware Component', iconData: Icons.image_not_supported, onTap: () {}),
//             _SliderMenuItem(
//                 title: 'LogOut',
//                 iconData: Icons.arrow_back_ios,
//                 onTap: () {
//                   signout(context);
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _SliderMenuItem extends StatelessWidget {
//   final String title;
//   final IconData iconData;
//   final Function()? onTap;
//
//   const _SliderMenuItem(
//       {Key? key,
//       required this.title,
//       required this.iconData,
//       required this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         title: Text(title,
//             style: TextStyle(color: Color(0xff7C7C7A), fontSize: 25)),
//         leading: Icon(iconData, color: Colors.black, size: 30),
//         onTap: onTap);
//   }
// }
