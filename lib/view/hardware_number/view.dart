import 'package:app_final/core/components/DefaultFormField.dart';
import 'package:app_final/core/components/button_registration.dart';
import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HardWare_Number extends StatelessWidget {
   HardWare_Number({Key? key}) : super(key: key);
  @override
  TextEditingController? controller =TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Component"),
        ),
        body: SafeArea(
          child: Container(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                                height: 250,
                                child: Image.asset(
                                  "assets/images/dron.gif",
                                  fit: BoxFit.cover,
                                ))),
                      ), // Put FortuneWheel here instead of Container
                    ),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: BoxDecoration(
                      color: AppColor.greenDark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60)),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            "Component slice number: ",
                            style: mediumStylewhite.apply(color: Colors.white),
                          ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: TextFormField(


                          cursorColor: AppColor.greenDark,
                          controller: controller,
                          style: const TextStyle(color:AppColor.white, fontSize: 19,height: 1.5),
                          decoration: InputDecoration(
                            filled: true,

                            contentPadding:

                            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            fillColor:AppColor.greenDark,
                            labelText:"Enter your number here",
                            labelStyle: const TextStyle(color: AppColor.white, fontSize: 20),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColor.white),
                              //  when the TextFormField in focused
                            ) ,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColor.white),

                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColor.white),

                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColor.white),

                              ),

                            hintStyle: const TextStyle(color: AppColor.white, fontSize: 20),

                            // border: OutlineInputBorder(),

                          ),
                        ),
                      ),
                          Spacer(),
                          Center(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: AppColor.white,
                                  ),
                                  child: Center(
                                    child: Text("Done",
                                        style: TextStyle(
                                            color: AppColor.greenDark,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600)),
                                  )),
                            ),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
