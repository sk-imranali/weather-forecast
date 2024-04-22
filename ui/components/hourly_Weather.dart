

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weather_radar/ui/components/todays_weather.dart';

import '../../model/weather_model.dart';
import '../../services/api_services.dart';
import 'future_forecast_item.dart';
import 'hourly_weather_listItem.dart';

class HourlyWeather extends StatefulWidget {
  const HourlyWeather({super.key});

  @override
  State<HourlyWeather> createState() => _WeaklyWeatherState();
}

class _WeaklyWeatherState extends State<HourlyWeather> {
  ApiService apiService = ApiService();
  final _textFieldController = TextEditingController();
  String searchText = "auto:ip";

  // final myInterestitial =  InterstitialAd.load(
  //     adUnitId: Platform.isAndroid?"ca-app-pub-3940256099942544/1033173712":"",
  //     request: AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       // Called when an ad is successfully received.
  //       onAdLoaded: (ad) {
  //         ad.show();
  //         //debugPrint('$ad loaded.');
  //         // Keep a reference to the ad so you can show it later.
  //       },
  //       // Called when an ad request failed.
  //       onAdFailedToLoad: (LoadAdError error) {
  //         debugPrint('InterstitialAd failed to load: $error');
  //       },
  //     ));
  // @override
  // void initState() {
  //  myInterestitial;
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("24 hours Forecast",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white,),
      ),

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/weather.jpg",),fit: BoxFit.cover,
            )
        ),
        child: SingleChildScrollView(

          scrollDirection: Axis.vertical,
          child: SafeArea(
              child: FutureBuilder(
                builder: (context, snapshot) {

                  if (snapshot.hasData) {
                    WeatherModel? weatherModel = snapshot.data;
                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          // TodayWeather(
                          //   weatherModel: weatherModel,
                          // ),
                          Padding(
                            padding: EdgeInsets.only(left: 5,right: 5),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,

                                ),
                                itemBuilder: (context, index) {
                                  Hour? hour = weatherModel
                                      ?.forecast?.forecastday?[0].hour?[index];
                                  return HourlyWeatherListItem(
                                    hour: hour,
                                  );
                                },
                                itemCount: weatherModel
                                    ?.forecast?.forecastday?[0].hour?.length,
                                scrollDirection: Axis.vertical,
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error has accured"),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                future: apiService.getWeatherData(searchText),
              )),
        ),
      ),
    );
  }
}
