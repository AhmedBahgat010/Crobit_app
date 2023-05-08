import 'package:flutter/material.dart';

import '../../../core/style/my_colors.dart';
import '../../../core/style/my_style.dart';

class BasicRates extends StatelessWidget {
  const BasicRates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 150,
        width: 115,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.greenDark),
          borderRadius: BorderRadius.circular(20), //<-- S
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Humidity",
              style: hintStyle.apply(color: AppColor.black),
            ),
            Text(
              "normal",
              style: hintStyle2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("30%", style: labelStyle.apply(fontSizeDelta: 6)),
                CircleAvatar(
                  radius: 14,
                  child: Icon(Icons.arrow_upward_rounded),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
