import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/Home/Map/cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:location/location.dart';
import 'package:polymaker/core/models/trackingmode.dart';
import 'package:polymaker/polymaker.dart' as polymaker;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'cubit/cubit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  String? _currentAddress;
  Position? _currentPosition;
  List<LatLng>? locationList ;
  List<Map<String, dynamic>?>? map;
  bool sent =false;

  Future<bool> _handleLocationPermission() async {
    bool? serviceEnabled;
    LocationPermission? permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  void getLocation() async {
    await _getCurrentPosition();
    List<LatLng>? result = await polymaker.getLocation(
      context,
      trackingMode: TrackingMode.PLANAR,
      enableDragMarker: true,
      autoEditMode: false,
      // iconEditMode:IconData(20,matchTextDirection: false),
      targetCameraPosition: LatLng(_currentPosition!.latitude.toDouble(),
          _currentPosition!.longitude.toDouble()),
    );
    if (result != null) {
      setState(() {
        locationList = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    locationList = [];
    print("${locationList}" + "initState");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapCubit(),
      child: BlocConsumer<MapCubit, MapStates>(
        listener: (context, state) {
          // TODO: implement listener

          print(state);
        },
        builder: (context, state) {


          List<Map<String, double>> formattedList = locationList?.map((LatLng location) {
            return {
              'lan': location.latitude,
              'long': location.longitude,
            };
          }).toList() ?? [];
          if (formattedList.isNotEmpty&&sent==false) {
            // Trigger the state change and send the formatted list to the API
            sent =true;

              print("ssssssssssssssssssssssssssssssssssssssss");
              MapCubit.get(context)?.PostMaps(map: formattedList);
          }



          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10),
                    child: Text(
                      "Location",
                      style: loginStyle.copyWith(
                          fontSize: 30, color: AppColor.black),
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
                              .map((val) =>
                                  "[${val.latitude}, ${val.longitude}]\n")
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
        },
      ),
    );
  }
}
