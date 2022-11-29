import 'package:app_final/core/resource/navigator.dart';
import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/Home/situation/DiseasesScreen.dart';
import 'package:app_final/view/Home/situation/widget/situationContainer.dart';
import 'package:flutter/material.dart';

class SituationScreen extends StatefulWidget {
  const SituationScreen({Key? key}) : super(key: key);

  @override
  State<SituationScreen> createState() => _SituationScreenState();
}

class _SituationScreenState extends State<SituationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Diagnose'),
        ),
        body: ListView.builder(

          itemCount: 10,
          itemBuilder: (context, index) {
            return SituationContainer(
              titel: "early blight",

              image: "assets/images/img.png",
            );
          },
        ));
  }
}
