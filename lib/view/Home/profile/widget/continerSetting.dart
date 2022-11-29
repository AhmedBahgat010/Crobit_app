import 'package:flutter/material.dart';

import '../../../../core/style/my_colors.dart';
import '../../../../core/style/my_style.dart';
class ContainerSetting extends StatelessWidget {
  final IconData icon;
  final String titel;
  final Color color;
  final Function onTap;
   ContainerSetting(  {Key? key, required this.icon, required this.titel, required this.color, required this.onTap,} ) ;

  @override
  Widget build(BuildContext context) {
    return           Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: const BoxDecoration(),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(width: 10,),
            Center(
              child: Text(
                titel,
                style: mediumStyle,
              ),
            ),
            Spacer(),
            Icon(Icons.navigate_next, color: black, size: 40),              ],
        ),
      ),
    )
      ;
  }
}
