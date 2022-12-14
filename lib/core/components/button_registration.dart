import 'package:flutter/material.dart';

import '../style/my_colors.dart';



class ButtonSign extends StatefulWidget {
  const ButtonSign({Key? key, required this.text, required this.ontap}) : super(key: key);
final String text;
final Function ontap;
  @override
  State<ButtonSign> createState() => _ButtonSignState();
}

class _ButtonSignState extends State<ButtonSign> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap:(){
          widget.ontap();
        },
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 1.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: greenDark,
            ),
            child: Center(
              child: Text(widget.text,
                  style: TextStyle(
                      color: white, fontSize: 22, fontWeight: FontWeight.w600)),
            )),
      ),
    );
  }
}
