import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_radar/ui/components/todays_weather.dart';

import '../../model/weather_model.dart';
import '../../services/api_services.dart';
import 'future_forecast_item.dart';

class WeaklyWeather extends StatefulWidget {
  const WeaklyWeather({super.key});

  @override
  State<WeaklyWeather> createState() => _WeaklyWeatherState();
}

class _WeaklyWeatherState extends State<WeaklyWeather> {
  ApiService apiService = ApiService();
  final _textFieldController = TextEditingController();
  String searchText = "auto:ip";

  // final myInterestitial = InterstitialAd.load(
  //     adUnitId:
  //         Platform.isAndroid ? "ca-app-pub-3940256099942544/1033173712" : "",
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
  //   // myInterestitial;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF0658F5),

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Next day Forecast",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/weather.jpg"), fit: BoxFit.cover)),
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
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                          ),
                          itemBuilder: (context, index) {
                            Forecastday? forecastday =
                                weatherModel?.forecast?.forecastday?[index];
                            return FutureForecastItem(
                              forecastday: forecastday,
                            );
                          },
                          itemCount:
                              weatherModel?.forecast?.forecastday?.length,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height,
                      //   child: ListView.builder(
                      //     itemBuilder: (context, index) {
                      //       Forecastday? forecastday =
                      //       weatherModel?.forecast?.forecastday?[index];
                      //       return FutureForecastItem(
                      //         forecastday: forecastday,
                      //       );
                      //     },
                      //     itemCount: weatherModel?.forecast?.forecastday?.length,
                      //     scrollDirection: Axis.vertical,
                      //   ),
                      // ),
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
