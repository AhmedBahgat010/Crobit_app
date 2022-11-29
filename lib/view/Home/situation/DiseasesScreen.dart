import 'package:app_final/core/style/my_style.dart';
import 'package:flutter/material.dart';
class DiseasesScreen extends StatefulWidget {
  final String image;
  final String titel;
  const DiseasesScreen({Key, required this.image, required this.titel, key}) : super(key: key);

  @override
  State<DiseasesScreen> createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titel),

      ),body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.asset(widget.image),
            Text("data")
          ],
        ),
      ),
    ),
    );
  }
}
