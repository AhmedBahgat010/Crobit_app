import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/view/Home/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'cubit/States.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

final PageController controller = PageController();

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SafeArea(
          child: Scaffold(
            //BottomBarDoubleBullet
            //BottomBarLabelSlide
            bottomNavigationBar: SalomonBottomBar(
              currentIndex:cubit!.currentIndex,
              onTap: (i) => setState(() {
                cubit.changeScreen(i);
              }),
              items: [
                /// Home
                SalomonBottomBarItem(

                  icon: Icon(Icons.home,color:AppColor.greenDark,size: 30),
                  title: Text("Home"),
                ),

                /// Likes
                SalomonBottomBarItem(
                  icon: Icon(Icons.chat_outlined,color:AppColor.greenDark,size: 30),
                  title: Text("Consultant"),
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: Icon(Icons.location_on_outlined,color:AppColor.greenDark,size: 30 ),
                  title: Text("location"),
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: Icon(Icons.notifications_outlined,color:AppColor.greenDark,size: 30),
                  title: Text("Notification"),
                ),
              ],
            ),

            body: cubit.HomeScreens[cubit.currentIndex],
          ),
        );
      },
    );
  }
}
