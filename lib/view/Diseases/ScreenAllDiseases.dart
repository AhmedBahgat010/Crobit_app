import 'package:app_final/core/resource/app_strings.dart';
import 'package:app_final/core/resource/navigator.dart';
import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/Diseases/DiseasesScreen.dart';
import 'package:flutter/material.dart';

class AllDiseasesScreen extends StatelessWidget {
  const AllDiseasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diseases"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerAllDiseases(
                  image: "assets/images/insects.png",
                  title: "Insects",
                  ontap: () {
                    navigateTo(context, DiseasesScreen(Diseases: HasInsects));
                  },
                ),
                ContainerAllDiseases(
                  image: "assets/images/Weeds.png",
                  title: "Weeds",
                  ontap: () {
                    navigateTo(context, DiseasesScreen(Diseases: HasWeeds));
                  },
                ),
                ContainerAllDiseases(
                  image: "assets/images/Diseases.png",
                  title: "Diseases",
                  ontap: () {
                    navigateTo(context, DiseasesScreen(Diseases: HasDiseases));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerAllDiseases extends StatelessWidget {
  ContainerAllDiseases({
    Key? key,
    required this.image,
    required this.title,
    required this.ontap,
  }) : super(key: key);
  final String image;
  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 310,
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.greenDark, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.greenDark,
              radius: 50,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 70,
              ),
            ),
            Text(
              title,
              style: labelStyle.copyWith(fontSize: 30),
            ),
            InkWell(
              onTap: ontap,
              child: Container(
                height: 34,
                width: 170,
                decoration: BoxDecoration(
                  color: AppColor.greenDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Read More",
                        style: mediumStylewhite.copyWith(fontSize: 20),
                      ),
                      Container(
                        height: 22,
                        width: 25,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(Icons.navigate_next_outlined,
                            color: AppColor.greenDark),
                      )
                    ]),
              ),
            )
          ],
        ));
  }
}
