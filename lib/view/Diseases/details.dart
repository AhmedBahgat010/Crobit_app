import 'package:app_final/core/style/my_colors.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/style/my_style.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.photo, required this.sugestedTreatment, required this.description, required this.name}) : super(key: key);
  final String photo;
  final String sugestedTreatment;
  final String description;
  final String name;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Added
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Diseases",
              style: TextStyle(color: AppColor.black, fontSize: 30)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.name,                      style: labelStyle2.apply(fontSizeDelta: 10),
                  ),
                  CarouselSlider(
                      items: [
                        Image.network(widget.photo),
                      ],
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50,
                          // width: MediaQuery.of(context).size.width,
                          child: (TabBar(
                            labelColor: AppColor.greenDark,
                            unselectedLabelColor: AppColor.gray,
                            labelStyle:
                                mediumStylewhite.apply(fontWeightDelta: 15),
                            isScrollable: true,
                            tabs: <Widget>[
                              Tab(
                                text: 'Symptoms',
                              ),
                              Tab(
                                text: 'Prevention',
                              ),
                              Tab(
                                text: 'What caused it',
                              ),
                            ],
                          )),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: TabBarView(
                              children: [
                                Text(
                            widget.description,                                  style:
                                      hintStyle2.apply(color: AppColor.black),
                                ),
                                Text(
                                  widget.sugestedTreatment,                                    style:
                                      hintStyle2.apply(color: AppColor.black),
                                ),
                                Text(
                                  widget.description,                                    style:
                                      hintStyle2.apply(color: AppColor.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
