import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../model/weather_model.dart';

class FutureForecastItem extends StatelessWidget {
  final Forecastday? forecastday;
  const FutureForecastItem({super.key, this.forecastday});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(13),
      width: 140.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12.withOpacity(0.2)),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.j().format(
                          DateTime.parse(forecastday?.date?.toString() ?? "")),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      DateFormat.yMMMMd('en_US').format(
                          DateTime.parse(forecastday?.date?.toString() ?? "")),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sunrise",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Text(
                          forecastday?.astro?.sunrise?.toString() ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Text("Sunset",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        Text(
                          forecastday?.astro?.sunset?.toString() ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Moonrise",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text(
                              forecastday?.astro?.moonrise?.toString() ?? "",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text("Moonset",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            Text(
                              forecastday?.astro?.moonset?.toString() ?? "",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.cyanAccent),
                      child: Image.network(
                          "https:${forecastday?.day?.condition?.icon.toString() ?? ""}"),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      forecastday?.day?.condition?.text ?? "",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
          SizedBox(height: 13.h),
          Divider(
            height: 20.h,
            thickness: 2,
            color: Colors.white,
          ),
          SizedBox(height: 13.h),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Max Temp",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text("Min Temp",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Avgtemp",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Max Wind",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Max Wind",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Precipition",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Total Snow",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      //Spacer(),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${forecastday?.day?.maxtempC.toString() ?? ""}o",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                  "${forecastday?.day?.mintempC.toString() ?? ""}",
                                  style: TextStyle(color: Colors.white)),
                              Text(forecastday?.day?.avgtempC.toString() ?? "",
                                  style: TextStyle(color: Colors.white)),
                              Text(
                                  "${forecastday?.day?.maxwindKph.toString() ?? ""}Kph",
                                  style: TextStyle(color: Colors.white)),
                              Text(
                                  "${forecastday?.day?.maxwindKph.toString() ?? ""}mph",
                                  style: TextStyle(color: Colors.white)),
                              Text(
                                  "${forecastday?.day?.totalprecipIn.toString() ?? ""}In",
                                  style: TextStyle(color: Colors.white)),
                              Text(
                                  "${forecastday?.day?.totalprecipMm.toString() ?? ""}mm",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Avg Visibity",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Text("Avg Visibity",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Text("Daily will Rain",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Text("Daily chance rain",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Text("Daily will it snow",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Text("Daily chance snow",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Text("UV",
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${forecastday?.day?.avgvisKm.toString() ?? ""}km",
                              style: TextStyle(color: Colors.white)),
                          Text(
                              "${forecastday?.day?.avgvisMiles.toString() ?? ""}miles",
                              style: TextStyle(color: Colors.white)),
                          Text(
                              forecastday?.day?.dailyWillItRain.toString() ??
                                  "",
                              style: TextStyle(color: Colors.white)),
                          Text(
                              forecastday?.day?.dailyChanceOfRain.toString() ??
                                  "",
                              style: TextStyle(color: Colors.white)),
                          Text(
                              forecastday?.day?.dailyWillItSnow.toString() ??
                                  "",
                              style: TextStyle(color: Colors.white)),
                          Text(
                              forecastday?.day?.dailyChanceOfSnow.toString() ??
                                  "",
                              style: TextStyle(color: Colors.white)),
                          Text(forecastday?.day?.uv.toString() ?? "",
                              style: TextStyle(color: Colors.white)),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
