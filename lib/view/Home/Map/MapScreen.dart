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
      enableDragMarker: true,autoEditMode: false,
       // iconEditMode:IconData(20,matchTextDirection: false),
      targetCameraPosition: LatLng(myLocation.latitude!.toDouble()	, myLocation.longitude!.toDouble()),
    );
    if (result != null) {
      setState(() {
        locationList = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
          Container(
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () => getLocation(),
              child: Text(
                "Select your land ",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
