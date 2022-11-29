import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/style/my_colors.dart';
import '../../../core/style/my_style.dart';

class ContainerFeatures extends StatefulWidget {
  final String image;
  final String title;
  final String buttontitle;
  final Function ontap;

  const ContainerFeatures({Key? key, required this.image, required this.title, required this.buttontitle, required this.ontap}) : super(key: key);

  @override
  State<ContainerFeatures> createState() => _ContainerFeaturesState();
}

class _ContainerFeaturesState extends State<ContainerFeatures> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.ontap();
      },child: Container(
        width: 175,
        height: 180,
        decoration:
            BoxDecoration(color: green, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
// backgroundImage: AssetImage('assets/images/img_5.png'),
                backgroundColor: white,
                child: Image.asset(
                 widget.image,
                  height: 40,
                ),
                maxRadius: 35,
              ),
              Text(
                widget.title,
                style: labelStyle,
              ),
              Container(
                height: 30,
                decoration: BoxDecoration(
                    color: greenDark, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.buttontitle,
                      style: GoogleFonts.cairo(
                        textStyle: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: white),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 30,
                      child: Center(
                          child: Icon(
                        Icons.navigate_next,
                        color: greenDark,
                      )),
                      decoration: BoxDecoration(
                          color: white, borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
