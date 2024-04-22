import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';
import 'package:weather_radar/model/weather_model.dart';

class HourlyWeatherListItem extends StatefulWidget {
  final Hour? hour;
  final WeatherModel? weatherModel;
  const HourlyWeatherListItem({super.key, this.hour, this.weatherModel});

  @override
  State<HourlyWeatherListItem> createState() => _HourlyWeatherListItemState();
}

class _HourlyWeatherListItemState extends State<HourlyWeatherListItem> {

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          color:Colors.black12.withOpacity(0.2)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      DateFormat.j()
                          .format(DateTime.parse(widget.hour?.time?.toString() ?? "")),
                      style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w500,fontSize: 15),
                    ),
                    Text(
                      DateFormat.yMMMMd('en_US')
                          .format(DateTime.parse(widget.hour?.time?.toString() ?? "")),
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 18, left: 18),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: Text(
                          widget.hour?.tempC?.round().toString() ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "oC",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
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
                          "https:${widget.hour?.condition?.icon.toString() ?? ""}"),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      widget.hour?.condition?.text ?? "",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
          Divider(
            height: 20.h,
            thickness: 1,
            color: Colors.white,
          ),
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
                            "Wind Chill",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text("Humidity",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Pressure",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Cloud cover",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Precipition",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Snow",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          Text("Feel Likes",
                              style: TextStyle(
                                color: Colors.white,
                              )),


                        ],
                      ),
                      SizedBox(width: 20.w),
                      //Spacer(),
                      Row(children: [Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${widget.hour?.windchillC?.toString() ?? ""}",style: TextStyle(color: Colors.white),),
                          Text("${widget.hour?.humidity?.toString() ?? ""}%",style: TextStyle(color: Colors.white)),
                          Text(widget.hour?.pressureIn?.toString() ?? "",style: TextStyle(color: Colors.white)),
                          Text("${widget.hour?.cloud?.toString() ?? ""}%",style: TextStyle(color: Colors.white)),
                          Text(widget.hour?.precipIn?.toString() ?? "",style: TextStyle(color: Colors.white)),
                          Text(widget.hour?.snowCm?.toString() ?? "",style: TextStyle(color: Colors.white)),
                          Text(widget.hour?.feelslikeC?.toString() ??"" ,style: TextStyle(color: Colors.white)),

                        ],
                      )
                      ],)


                    ],
                  ),

                ],
              ),
Spacer(),
            Row(
              children: [
                Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dew Point",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    Text("Heat Index",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    Text("Chance of Rain",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    Text("Visibity",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    Text("UV",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    Text("Wind Mph",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    Text("Wind Kph",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ],
                ),
                SizedBox(width: 20.w,),
                //Spacer(),
                Row(children: [Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.hour?.dewpointC?.toString() ?? "",style: TextStyle(color: Colors.white)),
                    Text(widget.hour?.heatindexC?.toString() ?? "",style: TextStyle(color: Colors.white)),
                    Text(widget.hour?.chanceOfRain?.toString() ?? "",style: TextStyle(color: Colors.white)),
                    Text(widget.hour?.visKm?.toString() ?? "",style: TextStyle(color: Colors.white)),
                    Text(widget.hour?.uv?.toString() ?? "",style: TextStyle(color: Colors.white)),
                    Text(widget.hour?.windMph?.toString() ?? "",style: TextStyle(color: Colors.white)),
                    Text(widget.hour?.windKph?.toString() ?? "",style: TextStyle(color: Colors.white)),
                  ],
                )
                ],)
              ],
            )
            ],
          ),

        ],
      ),
    );
  }
}
