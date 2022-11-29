import 'package:app_final/core/resource/constats.dart';
import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/Home/profile/widget/continerSetting.dart';
import 'package:flutter/material.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: Size.fromRadius(70), // Image radius
                child: Image.asset('assets/images/mem.jpg',fit: BoxFit.cover)
                // Image.network(
                //     'https://img.youm7.com/ArticleImgs/2022/1/12/28641-%D9%85%D9%85%D9%8A%D8%B2.jpg',
                //     fit: BoxFit.cover),
              ),
            ),
            Text("احمد الفلاااح", style: labelStyle2),
            Text(
              "Farmer",
              style: hintStyle2,
            ),
            Column(
              children: [
                ContainerSetting(
                  icon: Icons.person,
                  titel: "Edit Profile",
                  color: greenDark,
                  onTap: () {},
                ),
                ContainerSetting(
                  icon: Icons.location_on,
                  titel: " My Farm",
                  color: greenDark,
                  onTap: () {},
                ),
                ContainerSetting(
                  icon: Icons.help_outline,
                  titel: "Help & Support",
                  color: greenDark,
                  onTap: () {},
                ),
                ContainerSetting(
                  icon: Icons.settings,
                  titel: "Setting",
                  color: greenDark,
                  onTap: () {},
                ),
                ContainerSetting(
                  icon: Icons.star_rate,
                  titel: "Rate Us",
                  color: greenDark,
                  onTap: () {},
                ),
                ContainerSetting(
                  icon: Icons.logout,
                  titel: "Log out",
                  color: Colors.red,
                  onTap: () {
                    signout(context);
                  },
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
