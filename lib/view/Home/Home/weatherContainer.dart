import 'dart:convert';
import 'dart:ui';

import 'package:app_final/core/resource/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../core/style/my_colors.dart';
import '../../../core/style/my_style.dart';
import 'detail_page.dart';

class WeatherContainer extends StatefulWidget {
  const WeatherContainer({Key? key}) : super(key: key);

  @override
  State<WeatherContainer> createState() => _WeatherContainerState();
}

class _WeatherContainerState extends State<WeatherContainer> {
  final TextEditingController _cityController = TextEditingController();

  static String API_KEY =
      '6a2a367454c044ef8b005855232504'; //Paste Your API Here

  String location = 'Mansoura'; //Default location
  String weatherIcon = 'heavycloudy.png';
  int temperature = 0;
  int windSpeed = 0;
  int humidity = 0;
  int cloud = 0;
  String currentDate = '';

  List hourlyWeatherForecast = [];
  List dailyWeatherForecast = [];

  String currentWeatherStatus = '';

  //API Call
  String searchWeatherAPI = "https://api.weatherapi.com/v1/forecast.json?key=" +
      API_KEY +
      "&days=7&q=";

  void fetchWeatherData(String searchText) async {
    try {
      var searchResult =
          await http.get(Uri.parse(searchWeatherAPI + searchText));

      final weatherData = Map<String, dynamic>.from(
          json.decode(searchResult.body) ?? 'No data');

      var locationData = weatherData["location"];

      var currentWeather = weatherData["current"];

      setState(() {
        location = getShortLocationName(locationData["name"]);

        var parsedDate =
            DateTime.parse(locationData["localtime"].substring(0, 10));
        var newDate = DateFormat('MMMMEEEEd').format(parsedDate);
        currentDate = newDate;

        //updateWeather
        currentWeatherStatus = currentWeather["condition"]["text"];
        weatherIcon =
            currentWeatherStatus.replaceAll(' ', '').toLowerCase() + ".png";
        temperature = currentWeather["temp_c"].toInt();
        windSpeed = currentWeather["wind_kph"].toInt();
        humidity = currentWeather["humidity"].toInt();
        cloud = currentWeather["cloud"].toInt();

        //Forecast data
        dailyWeatherForecast = weatherData["forecast"]["forecastday"];
        hourlyWeatherForecast = dailyWeatherForecast[0]["hour"];
        print(dailyWeatherForecast);
      });
    } catch (e) {
      //debugPrint(e);
    }
  }

  //function to return the first two names of the string location
  static String getShortLocationName(String s) {
    List<String> wordList = s.split(" ");

    if (wordList.isNotEmpty) {
      if (wordList.length > 1) {
        return wordList[0] + " " + wordList[1];
      } else {
        return wordList[0];
      }
    } else {
      return " ";
    }
  }

  @override
  void initState() {
    fetchWeatherData(location);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Stack(children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/images/img_3.png',
                          fit: BoxFit.fill,
                        ),
                        height: height,
                        width: width,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 20, right: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(temperature.toString(),
                                    style:  TextStyle(
                                      color: AppColor.white,
                                      fontSize: 70,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text(
                                  'o',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [

                                  WeatherItem(
                                    value: windSpeed.toInt(),
                                    unit: ' km/h',
                                    imageUrl: 'assets/images/windspeed.png',
                                  ),
                                  WeatherItem(
                                    value: humidity.toInt(),
                                    unit: '%',
                                    imageUrl: 'assets/images/humidity.png',
                                  ),
                                  WeatherItem(
                                    value: cloud.toInt(),
                                    unit: '%',
                                    imageUrl: 'assets/images/cloud.png',
                                  ), Spacer(), Text(currentWeatherStatus,
                                      style: GoogleFonts.cairo(
                                          textStyle: TextStyle(
                                            color: AppColor.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.topRight / 1.1,
                          child: Container(
                            height: 100,
                            width: 150,
                            child: Image.asset(
                              "assets/images/" + weatherIcon,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Today', style: labelStyle2),
                  GestureDetector(
                    onTap: () => navigateTo(context, DetailPage(
                      dailyForecastWeather: dailyWeatherForecast,
                    )) ,
                    //this will open forecast screen
                    child: Text('Forecasts',
                        style: hintStylegreen.copyWith(
                          color: AppColor.greenDark,
                          decoration: TextDecoration.underline,

                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0,bottom: 30),
          child: SizedBox(
            height: 110,
            child: ListView.builder(
              itemCount: hourlyWeatherForecast.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                String currentTime =
                DateFormat('HH:mm:ss').format(DateTime.now());
                String currentHour = currentTime.substring(0, 2);

                String forecastTime = hourlyWeatherForecast[index]
                ["time"]
                    .substring(11, 16);
                String forecastHour = hourlyWeatherForecast[index]
                ["time"]
                    .substring(11, 13);

                String forecastWeatherName =
                hourlyWeatherForecast[index]["condition"]["text"];
                String forecastWeatherIcon = forecastWeatherName
                    .replaceAll(' ', '')
                    .toLowerCase() +
                    ".png";

                String forecastTemperature =
                hourlyWeatherForecast[index]["temp_c"]
                    .round()
                    .toString();
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(right: 20),
                  width: 65,
                  decoration: BoxDecoration(
                      color: currentHour == forecastHour
                          ? Colors.white
                          : AppColor.greenDark,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 6,
                          color:
                          AppColor.greenDark.withOpacity(.3),
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        forecastTime,
                        style: TextStyle(
                          fontSize: 17,
                          color: currentHour == forecastHour
                              ?AppColor.black
                              :  Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Image.asset(
                        'assets/images/' + forecastWeatherIcon,
                        width: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            forecastTemperature,
                            style: TextStyle(
                              color: currentHour == forecastHour
                                  ?AppColor.black
                                  :  Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'o',
                            style: TextStyle(
                              color: currentHour == forecastHour
                                  ?AppColor.black
                                  :  Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              fontFeatures: const [
                                FontFeature.enable('sups'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

      ],
    );
  }
}

class WeatherItem extends StatelessWidget {
  final int value;
  final String unit;
  final String imageUrl;

  const WeatherItem({
    Key? key,
    required this.value,
    required this.unit,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          Container(
            height: 30,
            width: 30,

            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Image.asset(
                  imageUrl,
                  color: AppColor.white,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            value.toString() + unit,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
