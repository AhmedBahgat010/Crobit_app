import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:flutter/material.dart';

class DiagnoseScreen extends StatefulWidget {
  const DiagnoseScreen({Key? key}) : super(key: key);

  @override
  State<DiagnoseScreen> createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diagnose"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Diseases in your crop:",
                  style: labelStyle2,
                ),
                DiseasesContainer(context,
                    title: 'White Spikes', data: 'Aug 20, 2022',ontap: (){print("00000");}),
                DiseasesContainer(context,
                    title: 'Posifolia fusiformis', data: 'Aug 20, 2022',ontap: (){print("111111111");}),
                DiseasesContainer(context, title: 'Rust', data: 'Aug 20, 2022',ontap: (){print("2222222");}),
              ]),
        ),
      ),
    );
  }
}

Widget DiseasesContainer(
  context, {
  required String title,
  required String data,
  required Function ontap,
}) {
  return Container(
    height: 140,
    margin: const EdgeInsets.symmetric(vertical: 7),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.greenDark, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            "https://i0.wp.com/geopard.tech/wp-content/uploads/2021/12/Crop-Diseases_-Types-Causes-and-Symptoms-3-min-1.jpg?w=1200&ssl=1",
            fit: BoxFit.cover,
            width: 160,
            height: 96,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: grayText.apply(color: AppColor.greenDark),
            ),
            Text(
              data,
              style: hintStyle2,
            ),
            InkWell(
              onTap: (){ontap();},
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
                        style: hintStylegreen.apply(color: AppColor.white),
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
        )
      ]),
    ),
  );
}
