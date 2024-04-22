import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';

import 'package:intl/intl.dart';
import 'package:weather_radar/model/weather_model.dart';

import '../../services/api_services.dart';
import 'hourly_weather_listItem.dart';

class TodayWeather extends StatefulWidget {
  final WeatherModel? weatherModel;
  final Hour? hour;
  final Forecastday? forecastday;
  TodayWeather({super.key, this.weatherModel, this.forecastday, this.hour});
  @override
  State<TodayWeather> createState() => _TodayWeatherState();
}

class _TodayWeatherState extends State<TodayWeather> {
  WeatherType getWeatherType(Current? current) {
    if (current?.isDay == 1) {
      if (current?.condition?.text == "Sunny") {
        return WeatherType.sunny;
      } else if (current?.condition?.text == "OverCast") {
        return WeatherType.overcast;
      } else if (current?.condition?.text == "Partly Cloudy") {
        return WeatherType.cloudy;
      } else if (current?.condition?.text == "Cloudy") {
        return WeatherType.cloudy;
      } else if (current?.condition?.text == "Mist") {
        return WeatherType.lightSnow;
      } else if (current!.condition!.text!.contains("thunder")) {
        return WeatherType.thunder;
      } else if (current?.condition?.text == "rain") {
        return WeatherType.heavyRainy;
      } else if (current?.condition?.text == "showers") {
        return WeatherType.middleSnow;
      } else if (current?.condition?.text == "Clear") {
        return WeatherType.sunny;
      }
    } else {
      if (current?.condition?.text == "Sunny") {
        return WeatherType.sunny;
      } else if (current?.condition?.text == "OverCast") {
        return WeatherType.overcast;
      } else if (current?.condition?.text == "Partly Cloudy") {
        return WeatherType.cloudyNight;
      } else if (current?.condition?.text == "Cloudy") {
        return WeatherType.cloudyNight;
      } else if (current?.condition?.text == "Mist") {
        return WeatherType.lightSnow;
      } else if (current!.condition!.text!.contains("thunder")) {
        return WeatherType.thunder;
      } else if (current?.condition?.text == "rain") {
        return WeatherType.heavyRainy;
      } else if (current?.condition?.text == "showers") {
        return WeatherType.middleSnow;
      } else if (current?.condition?.text == "Clear") {
        return WeatherType.sunnyNight;
      }
    }
    return WeatherType.thunder;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(
        children: [
          WeatherBg(
            weatherType: getWeatherType(widget.weatherModel?.current),
            width: MediaQuery.of(context).size.width,
            //  height: MediaQuery.of(context).size.height
            height: 425.h,
          ),
          SizedBox(
            width: double.infinity,
            height: 425.h,
            //  height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                children: [
                  // Container(
                  //   padding: EdgeInsets.all(8),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white12,
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: Column(
                  //     children: [
                  //       Text(
                  //         weatherModel?.location?.name ?? "",
                  //         style: TextStyle(
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.white),
                  //       ),
                  //       Text(
                  //         DateFormat.yMMMMd('en_US').format(DateTime.parse(
                  //             weatherModel?.current?.lastUpdated.toString() ??
                  //                 "")),
                  //         style: TextStyle(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.white),
                  //       ),
                  //       Text(
                  //         DateFormat.jm().format(DateTime.parse(
                  //             weatherModel?.current?.lastUpdated.toString() ??
                  //                 "")),
                  //         style: TextStyle(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.white),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.weatherModel?.location?.name ?? "",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
                              Text(
                                DateFormat.yMMMMd('en_US').format(
                                    DateTime.parse(widget
                                            .weatherModel?.current?.lastUpdated
                                            .toString() ??
                                        "")),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                DateFormat.jm().format(
                                  DateTime.parse(
                                    widget.weatherModel?.current?.lastUpdated
                                            .toString() ??
                                        "",
                                  ),
                                ),
                                style: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white12),
                            child: Image.network(
                                "https:${widget.weatherModel?.current?.condition?.icon ?? ""}"),
                          ),
                          // Text(
                          //   DateFormat.yMMMMEEEEd().format(DateTime.parse(
                          //       weatherModel?.current?.lastUpdated.toString() ?? "")),
                          //   style: TextStyle(
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.white),
                          // ),
                          //),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 2),
                                      child: Text(
                                        widget.weatherModel?.current?.tempC
                                                ?.round()
                                                .toString() ??
                                            "",
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.redAccent),
                                      ),
                                    ),
                                    Text(
                                      "o",
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 20),
                                    )
                                  ],
                                ),
                                Text(
                                  widget.weatherModel?.current?.condition
                                          ?.text ??
                                      "",
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      //  borderRadius: BorderRadius.circular(38),
                      color: Colors.white10,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Wind mph",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text("Wind Kph",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Text("pressure",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Text("Pressure",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Text("Precipition",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    Text("Precipition",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                //Spacer(),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${widget.weatherModel?.current?.windMph ?? "".toString() ?? ""} mph",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                            "${widget.weatherModel?.current?.windKph.toString() ?? ""} kph",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                            "${widget.weatherModel?.current?.pressureMb.toString() ?? ""} mb",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                            "${widget.weatherModel?.current?.pressureIn.toString() ?? ""} in",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                            "${widget.weatherModel?.current?.precipIn.toString() ?? ""} mm",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                            "${widget.weatherModel?.current?.precipMm.toString() ?? ""} in",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Humidity",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                Text("Visibity",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                Text("Feel Like",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                Text("Feel like",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                Text("UV",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                Text("Cloud",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            //Spacer(),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${widget.weatherModel?.current?.humidity ?? "".toString() ?? ""} mph",
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                        "${widget.weatherModel?.current?.visKm ?? "".toString()} km",
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                        "${widget.weatherModel?.current?.feelslikeC ?? "".toString()} c",
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                        "${widget.weatherModel?.current?.feelslikeF ?? "".toString()} f",
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                        "${widget.weatherModel?.current?.uv ?? "".toString()}",
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                        "${widget.weatherModel?.current?.cloud ?? "".toString()}",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
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
