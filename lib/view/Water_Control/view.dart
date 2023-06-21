import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:flutter_switch/flutter_switch.dart';
class WaterControl extends StatefulWidget {
  const WaterControl({Key? key}) : super(key: key);

  @override
  State<WaterControl> createState() => _WaterControlState();
}

class _WaterControlState extends State<WaterControl> {
  bool status = false;
  bool value = false;
  bool value2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Irrigation Control"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: LiquidCircularProgressIndicator(
                value: 0.50,
                // Defaults to 0.5.
                valueColor: AlwaysStoppedAnimation(Color(0xff93DCEC)),
                // Defaults to the current Theme's accentColor.
                backgroundColor: Colors.white,
                // Defaults to the current Theme's backgroundColor.
                borderColor: Colors.grey[300],
                borderWidth: 5.0,
                direction: Axis.vertical,
                // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal =
                // left to right). Defaults to Axis.vertical.
                center: Text(
                  "50%",
                  style:
                      labelStyle.apply(fontSizeDelta: 20, color:Colors.grey[300]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 5,
            width: MediaQuery.of(context).size.width / 1.2,
            child: LiquidLinearProgressIndicator(
              value: 0.50,
              // Defaults to 0.5.
              valueColor: AlwaysStoppedAnimation((Color(0xff93DCEC))),
              // Defaults to the current Theme's accentColor.
              backgroundColor: Colors.white,
              // Defaults to the current Theme's backgroundColor.
              // borderColor: Colors.red,
              // borderWidth: 30.0,
              // borderRadius: .0,
              direction: Axis
                  .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
            ),
          ),
          SizedBox(height: 20,),

          Row(                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Row(
                children: [
                  Checkbox(
                    value: this.value,
                    onChanged: ( value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  Text("Complete",style: hintStyle2,),
                ],
              ), //Checkbox
              Row(
                children: [
                  Checkbox(
                    value: this.value2,
                    onChanged: ( value) {
                      setState(() {
                        this.value2 = value!;
                      });
                    },
                  ),
                  Text("Almost complete",style: hintStyle2,),
                ],
              ), //Checkbox
            ],
          ), //Checkbox
SizedBox(height: 50,),
      Center(
        child: Container(
          child: FlutterSwitch(
            width: 125.0,
            height: 55.0,
            valueFontSize: 25.0,
            toggleSize: 45.0,
            value: status,
            borderRadius: 30.0,
            padding: 8.0,
            activeColor: Color(0xff93DCEC),
inactiveColor: Color(0xE0BCBCBC),
            inactiveTextColor:AppColor.white ,
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ),
      ),

        ],
      ),
    );
  }
}
