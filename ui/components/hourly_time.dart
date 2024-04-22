import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_radar/model/weather_model.dart';

class HourlyTime extends StatelessWidget {
  final Hour? hour;
  const HourlyTime({Key? key, this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      width: 100.w,

      decoration: BoxDecoration(
          color:Colors.black12.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  hour?.tempC?.round().toString() ?? "",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "o",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Container(
            height: 30.h,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.teal),
            child: Image.network("https:${hour?.condition?.icon ?? ""}"),

          ),
          Text(DateFormat.j().format(DateTime.parse(
            hour?.time?.toString() ?? "",
          ),),style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
