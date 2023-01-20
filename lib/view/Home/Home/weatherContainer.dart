import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/style/my_colors.dart';
import '../../../core/style/my_style.dart';

class WeatherContainer extends StatefulWidget {
  const WeatherContainer({Key? key}) : super(key: key);

  @override
  State<WeatherContainer> createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(children: [
        Container(
          height: 200,
          child: Stack(
            // alignment: Alignment.topLeft,
            children: [
              Stack(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/img_3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20,left: 20,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text("32°",
                            style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                              color: AppColor.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w700,
                            ))),
                        Text("H:32°   L:27°", style: hintStylegreen),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" Egypt, Mansora", style: mediumStylewhite),
                              Text("Cloudy", style: mediumStylewhite),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      // top: height * -0.07,
                      // left: width * 0.40,
                      // right: width * -0.03,
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          'assets/images/img_1.png',
                          fit: BoxFit.cover,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
// Padding(
//   padding: const EdgeInsets.all(20.0),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Expanded(
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text("TEMPERATURE",style: grayText),
//             Text("32°",style: loginStyle),
//             Text("Real feel: 20",style: grayText),
//           ],),
//       ),
//       Image.asset('assets/images/img_1.png')
//
//     ],
//   ),
// ),
