import 'dart:ui';

import 'package:app_final/core/style/my_colors.dart';
import 'package:app_final/core/style/my_style.dart';
import 'package:app_final/view/Home/Home/weatherContainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final dailyForecastWeather;

  const DetailPage({Key? key, this.dailyForecastWeather}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var weatherData = widget.dailyForecastWeather;

    //function to get weather
    Map getForecastWeather(int index) {
      int maxWindSpeed = weatherData[index]["day"]["maxwind_kph"].toInt();
      int avgHumidity = weatherData[index]["day"]["avghumidity"].toInt();
      int chanceOfRain =
          weatherData[index]["day"]["daily_chance_of_rain"].toInt();

      var parsedDate = DateTime.parse(weatherData[index]["date"]);
      var forecastDate = DateFormat('EEEE, d MMMM').format(parsedDate);

      String weatherName = weatherData[index]["day"]["condition"]["text"];
      String weatherIcon =
          weatherName.replaceAll(' ', '').toLowerCase() + ".png";

      int minTemperature = weatherData[index]["day"]["mintemp_c"].toInt();
      int maxTemperature = weatherData[index]["day"]["maxtemp_c"].toInt();

      var forecastData = {
        'maxWindSpeed': maxWindSpeed,
        'avgHumidity': avgHumidity,
        'chanceOfRain': chanceOfRain,
        'forecastDate': forecastDate,
        'weatherName': weatherName,
        'weatherIcon': weatherIcon,
        'minTemperature': minTemperature,
        'maxTemperature': maxTemperature
      };
      return forecastData;
    }

    return Scaffold(
      backgroundColor: AppColor.greenDark,
      appBar: AppBar(
        title: const Text(
          'Forecasts',
          style: TextStyle(color: AppColor.white),
        ),
        centerTitle: true,
        backgroundColor: AppColor.greenDark,
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppColor.white),
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: size.height * .75,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    right: 20,
                    left: 20,
                    child: Container(
                      height: 300,
                      width: size.width * .7,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffBEE3CB),
                              Color(0xff4BA26A),
                            ]),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.1),
                            offset: const Offset(0, 25),
                            blurRadius: 3,
                            spreadRadius: -10,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Image.asset("assets/images/" +
                                getForecastWeather(0)["weatherIcon"]),
                            width: 130,
                          ),
                          Positioned(
                              top: 150,
                              left: 30,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                    getForecastWeather(0)["weatherName"],
                                    style: mediumStylewhite),
                              )),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Container(
                              width: size.width * .8,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WeatherItem(
                                    value:
                                        getForecastWeather(0)["maxWindSpeed"],
                                    unit: " km/h",
                                    imageUrl: "assets/images/windspeed.png",
                                  ),
                                  WeatherItem(
                                    value: getForecastWeather(0)["avgHumidity"],
                                    unit: "%",
                                    imageUrl: "assets/images/humidity.png",
                                  ),
                                  WeatherItem(
                                    value:
                                        getForecastWeather(0)["chanceOfRain"],
                                    unit: "%",
                                    imageUrl: "assets/images/lightrain.png",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            right: 20,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    getForecastWeather(0)["minTemperature"]
                                        .toString(),
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontSize: 70,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text(
                                  'o',
                                  style:TextStyle(
                                    fontSize: 25,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 320,
                            left: 0,
                            child: SizedBox(
                              height: 400,
                              width: size.width * .9,
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  Card(
                                    elevation: 3.0,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  getForecastWeather(
                                                      0)["forecastDate"],
                                                  style: mediumStyle.copyWith(
                                                      color:
                                                          AppColor.black)),
                                              Row(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        getForecastWeather(0)[
                                                                "minTemperature"]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AppColor.gray,
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'o',
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.gray,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFeatures: const [
                                                              FontFeature
                                                                  .enable(
                                                                      'sups'),
                                                            ]),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 8,),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        getForecastWeather(0)[
                                                                "maxTemperature"]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AppColor.greenDark,
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'o',
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.greenDark,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFeatures: const [
                                                              FontFeature
                                                                  .enable(
                                                                      'sups'),
                                                            ]),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/' +
                                                        getForecastWeather(
                                                            0)["weatherIcon"],
                                                    width: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    getForecastWeather(
                                                        0)["weatherName"],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getForecastWeather(0)[
                                                                "chanceOfRain"]
                                                            .toString() +
                                                        "%",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Image.asset(
                                                    'assets/images/lightrain.png',
                                                    width: 30,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 3.0,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  getForecastWeather(
                                                      1)["forecastDate"],
                                                  style: mediumStyle.copyWith(
                                                      color:
                                                          AppColor.black)),
                                              Row(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        getForecastWeather(1)[
                                                                "minTemperature"]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AppColor.gray,
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'o',
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.gray,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFeatures: const [
                                                              FontFeature
                                                                  .enable(
                                                                      'sups'),
                                                            ]),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 8,),
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        getForecastWeather(1)[
                                                        "maxTemperature"]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AppColor.greenDark,
                                                          fontSize: 30,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'o',
                                                        style: TextStyle(
                                                            color:
                                                            AppColor.greenDark,
                                                            fontSize: 15,
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            fontFeatures: const [
                                                              FontFeature
                                                                  .enable(
                                                                  'sups'),
                                                            ]),
                                                      ),
                                                    ],
                                                  ),                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/' +
                                                        getForecastWeather(
                                                            1)["weatherIcon"],
                                                    width: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    getForecastWeather(
                                                        1)["weatherName"],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    getForecastWeather(1)[
                                                                "chanceOfRain"]
                                                            .toString() +
                                                        "%",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Image.asset(
                                                    'assets/images/lightrain.png',
                                                    width: 30,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 3.0,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  getForecastWeather(
                                                      2)["forecastDate"],
                                                  style: mediumStyle.copyWith(
                                                      color:
                                                          AppColor.black)),
                                              Row(
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        getForecastWeather(2)[
                                                                "minTemperature"]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AppColor.gray,
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'o',
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.gray,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFeatures: const [
                                                              FontFeature
                                                                  .enable(
                                                                      'sups'),
                                                            ]),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 8,),
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        getForecastWeather(2)[
                                                        "maxTemperature"]
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: AppColor.greenDark,
                                                          fontSize: 30,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        'o',
                                                        style: TextStyle(
                                                            color:
                                                            AppColor.greenDark,
                                                            fontSize: 15,
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            fontFeatures: const [
                                                              FontFeature
                                                                  .enable(
                                                                  'sups'),
                                                            ]),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/' +
                                                        getForecastWeather(
                                                            2)["weatherIcon"],
                                                    width: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    getForecastWeather(
                                                        2)["weatherName"],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    getForecastWeather(2)[
                                                    "chanceOfRain"]
                                                        .toString() +
                                                        "%",
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey,
                                                    ),
                                                  ),

                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Image.asset(
                                                    'assets/images/lightrain.png',
                                                    width: 30,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
