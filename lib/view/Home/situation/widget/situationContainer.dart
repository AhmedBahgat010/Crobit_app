import 'package:app_final/core/style/my_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/resource/navigator.dart';
import '../../../../core/style/my_colors.dart';
import '../DiseasesScreen.dart';

class SituationContainer extends StatelessWidget {
  final String titel;
  // final Function ontap;
  final String image;
  const SituationContainer({Key? key, required this.titel, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        height: 125,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Color(0xFFF3F3F3), borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: (){
            navigateTo(context, DiseasesScreen(image: image, titel: titel,));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Image.asset( image,
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width / 2.2),
              ),
              Text(
                titel,
                style: labelStyle,
              ),
              Spacer(),
              Center(
                  child: Icon(Icons.navigate_next, color: greenDark, size: 40)),
            ],
          ),
        ));
  }
}
