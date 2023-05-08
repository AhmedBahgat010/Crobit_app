import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polymaker/core/models/trackingmode.dart';
import 'package:polymaker/polymaker.dart' as polymaker;
import 'package:location/location.dart';

import 'LocationService.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<LatLng>? locationList;
  late LocationData locationData;

  void getLocation() async {
    LocationData myLocation = await LocationService().getLocation();
    var result = await polymaker.getLocation(
      context,
      trackingMode: TrackingMode.PLANAR,
      enableDragMarker: true,
      autoEditMode: false,
      // iconEditMode:IconData(20,matchTextDirection: false),
      targetCameraPosition: LatLng(
          myLocation.latitude!.toDouble(), myLocation.longitude!.toDouble()),
    );
    if (result != null) {
      setState(() {
        locationList = result;
      });
    }
  }

  // void getLocation() async {
  //   var result = await polymaker.getLocation(
  //     context,
  //     trackingMode: TrackingMode.PLANAR,
  //     enableDragMarker: true,
  //   );
  //   if (result != null) {
  //     setState(() {
  //       locationList = result;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: Text(
                "Location",
                style: loginStyle.copyWith(fontSize: 30, color: AppColor.black),
              ),
            ),
          ),
          Divider(
            color: AppColor.black,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Image.asset(
                  "assets/images/Location.png",
                  fit: BoxFit.cover,
                )),
          ),
          ////مهمممممممممممممممممممممممم
          Text(
            "Location Result: \n" +
                (locationList != null
                    ? locationList!
                        .map((val) => "[${val.latitude}, ${val.longitude}]\n")
                        .toString()
                    : ""),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            "To be able to continue.....",
            style: labelStyle2,
          ),
          Text("Please, Select your field.",
              style: mediumStylewhite.apply(
                  color: AppColor.black, fontSizeDelta: -2)),
          SizedBox(height: 10),
          InkWell(
            onTap: () => getLocation(),
            child: Container(
              height: 45,
              width: 200,
              decoration: BoxDecoration(
                  color: AppColor.greenDark,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Select",
                  style: mediumStylewhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
