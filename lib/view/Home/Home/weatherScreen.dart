import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/view/Home/Home/weatherContainer.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../core/style/my_style.dart';
import 'Containe_features.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,   //new line

      body: SliderDrawer(
        key: _key,
        appBar: SliderAppBar(
            appBarColor: Colors.white,
            // trailing:Text ("dddd"),
            title: Text("Crop Status", style: TextLoginButton)),
        slider:_SliderView(
          onItemClick: (title) {
            _key.currentState!.closeSlider();
            setState(() {
              // this.title = title;
            });
          },
        ) ,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeatherContainer(),
                Text(
                  "Main Features",
                  style: labelStyle2,
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
                        print('1111111111');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerModel {
  final String image;
  final String title;
  final String buttontitle;

  ContainerModel({
    required this.image,
    required this.title,
    required this.buttontitle,
  });
}

List<ContainerModel> containerModel = [
  ContainerModel(
    image: 'assets/images/img_5.png',
    title: 'Plant Growing',
    buttontitle: 'Scan Crop',
  ),
  ContainerModel(
    image: 'assets/images/img_6.png',
    title: 'Plant Growing',
    buttontitle: 'Scan Crop',
  ),
  ContainerModel(
    image: 'assets/images/img_7.png',
    title: 'Plant Growing',
    buttontitle: 'Scan Crop',
  ),
  ContainerModel(
    image: 'assets/images/img_8.png',
    title: 'Plant Growing',
    buttontitle: 'Scan Crop',
  ),
  ContainerModel(
    image: 'assets/images/img_9.png',
    title: 'Plant Growing',
    buttontitle: 'Scan Crop',
  ),
  ContainerModel(
    image: 'assets/images/img_10.png',
    title: 'Plant Growing',
    buttontitle: 'Scan Crop',
  ),
];


class _SliderView extends StatelessWidget {
  final Function(String)? onItemClick;

  const _SliderView({Key? key, this.onItemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 100,
              color:AppColor.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,

                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Ali mohamed",style: mediumStyle,),
                      Text("amoh@gmail.com",style: hintStyle2,),
                    ],)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _SliderMenuItem(
                title: 'Home', iconData: Icons.home, onTap: onItemClick),
            _SliderMenuItem(
                title: 'profile',
                iconData: Icons.person_outline_sharp,
                onTap: onItemClick),
            _SliderMenuItem(
                title: 'Notification',
                iconData: Icons.notifications_active,
                onTap: onItemClick),
            _SliderMenuItem(
                title: 'Likes', iconData: Icons.favorite, onTap: onItemClick),
            _SliderMenuItem(
                title: 'Setting', iconData: Icons.settings, onTap: onItemClick),

            _SliderMenuItem(
                title: 'LogOut',
                iconData: Icons.arrow_back_ios,
                onTap: onItemClick),
          ],
        ),
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function(String)? onTap;

  const _SliderMenuItem(
      {Key? key,
        required this.title,
        required this.iconData,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title,
            style: TextStyle(
                color: Color(0xff7C7C7A),fontSize: 25 )),
        leading: Icon(iconData, color: Colors.black,size: 30)
        ,
        onTap: () => onTap?.call(title)

    );
  }
}

