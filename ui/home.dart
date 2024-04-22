import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_radar/model/weather_model.dart';
import 'package:weather_radar/ui/components/todays_weather.dart';
import '../services/api_services.dart';
import 'components/future_forecast_item.dart';
import 'components/hourly_Weather.dart';
import 'components/hourly_time.dart';
import 'components/weekly_weather.dart';

class HomePage extends StatefulWidget {
  final Forecastday? forecastday;

  const HomePage({super.key, this.forecastday});

  @override
  State<HomePage> createState() => _HomePageState();
}

// WeatherType getWeatherType(Current? current) {
//   if (current?.isDay == 1) {
//     if (current?.condition?.text == "Sunny") {
//       return WeatherType.sunny;
//     } else if (current?.condition?.text == "OverCast") {
//       return WeatherType.overcast;
//     } else if (current?.condition?.text == "Partly Cloudy") {
//       return WeatherType.cloudy;
//     } else if (current?.condition?.text == "Cloudy") {
//       return WeatherType.cloudy;
//     } else if (current?.condition?.text == "Mist") {
//       return WeatherType.lightSnow;
//     } else if (current!.condition!.text!.contains("thunder")) {
//       return WeatherType.thunder;
//     } else if (current?.condition?.text == "rain") {
//       return WeatherType.heavyRainy;
//     } else if (current?.condition?.text == "showers") {
//       return WeatherType.middleSnow;
//     } else if (current?.condition?.text == "Clear") {
//       return WeatherType.sunny;
//     }
//   } else {
//     if (current?.condition?.text == "Sunny") {
//       return WeatherType.sunny;
//     } else if (current?.condition?.text == "OverCast") {
//       return WeatherType.overcast;
//     } else if (current?.condition?.text == "Partly Cloudy") {
//       return WeatherType.cloudyNight;
//     } else if (current?.condition?.text == "Cloudy") {
//       return WeatherType.cloudyNight;
//     } else if (current?.condition?.text == "Mist") {
//       return WeatherType.lightSnow;
//     } else if (current!.condition!.text!.contains("thunder")) {
//       return WeatherType.thunder;
//     } else if (current?.condition?.text == "rain") {
//       return WeatherType.heavyRainy;
//     } else if (current?.condition?.text == "showers") {
//       return WeatherType.middleSnow;
//     } else if (current?.condition?.text == "Clear") {
//       return WeatherType.sunnyNight;
//     }
//   }
//   return WeatherType.thunder;
// }
class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  late final WeatherModel? weatherModel;

  final _textFieldController = TextEditingController();
  String searchText = "auto:ip";
  _showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Search Location"),
            content: TextField(
              controller: _textFieldController,
              decoration:
                  InputDecoration(hintText: "search by city",hintStyle:TextStyle(color: Colors.grey)),

            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cencel",style: TextStyle(color: Colors.redAccent),),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_textFieldController.text.isEmpty) {
                    return;
                  }
                  Navigator.pop(context, _textFieldController.text);
                },
                child: Text("Ok",style: TextStyle(color: Colors.green)),
              ),
            ],
          );
        });
  }

  // final BannerAd myBanner = BannerAd(
  //   size: AdSize.banner,
  //   request: AdRequest(),
  //   adUnitId:
  //       Platform.isAndroid ? "ca-app-pub-3940256099942544/6300978111" : "",
  //   listener: BannerAdListener(
  //     // Called when an ad is successfully received.
  //     onAdLoaded: (Ad ad) => print('ad loaded.'),
  //     // setState(() {
  //     //   _isLoaded = true;
  //     // }
  //
  //     // Called when an ad request failed.
  //     onAdFailedToLoad: (Ad ad, err) {
  //       print('BannerAd failed to load:$err');
  //       // Dispose the ad here to free resources.
  //       ad.dispose();
  //     },
  //     // Called when an ad opens an overlay that covers the screen.
  //     onAdOpened: (Ad ad) {},
  //     // Called when an ad removes an overlay that covers the screen.
  //     onAdClosed: (Ad ad) {},
  //     // Called when an impression occurs on the ad.
  //     onAdImpression: (Ad ad) {},
  //   ),
  // );
  // @override
  // void initState() {
  //   myBanner.load();
  //   super.initState();
  // }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(

            children: [
              //Text("Weather",style: TextStyle(color: Colors.white),),
              RichText(
                text: TextSpan(
                    text: 'Weather',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Radar',
                        style: TextStyle(color: Colors.redAccent, fontSize: 20),
                      ),

                    ]),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                _textFieldController.clear();
                String text = await _showTextInputDialog(context);
                setState(() {
                  searchText = text;
                });
              },
              icon: Icon(Icons.search,color: Colors.black,size: 30.sp,)),
          IconButton(
              onPressed: () {
                searchText = "auto:ip";
                setState(() {});
              },
              icon: Icon(Icons.my_location,color: Colors.black,size: 30.sp)),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/weather.jpg"),
            fit: BoxFit.cover,
            opacity: 0.9,
          )),
          child: SafeArea(
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  WeatherModel? weatherModel = snapshot.data;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Column(
                      children: [
                        TodayWeather(
                          weatherModel: weatherModel,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        // Container(
                        //   height: 60,
                        //   width: double.infinity,
                        //   child: AdWidget(
                        //     ad: myBanner,
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.sp, right: 10.sp),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Hourly Forecast",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HourlyWeather()));
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            "24 Hours",
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.redAccent,
                                            size: 15,
                                          )
                                        ],
                                      )),

                                  //
                                  // Text(
                                  //   "24 Hours",
                                  //   style: TextStyle(
                                  //     color: Colors.redAccent,
                                  //     fontSize: 15,fontWeight: FontWeight.w500
                                  //   ),
                                  // ),
                                  // IconButton(onPressed: (){
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>HourlyWeather()));
                                  // },
                                  //     icon: Icon(Icons.arrow_forward_ios,color: Colors.redAccent,size: 15,
                                  //     )
                                  // ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: SizedBox(
                            height: 150.h,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                Hour? hour = weatherModel
                                    ?.forecast?.forecastday?[0].hour?[index];
                                return HourlyTime(
                                  hour: hour,
                                );
                              },
                              itemCount: weatherModel
                                  ?.forecast?.forecastday?[0].hour?.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.sp, right: 10.sp),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Daily Forecast",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Spacer(),

                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    WeaklyWeather()));
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            "Next Days",
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.redAccent,
                                            size: 15,
                                          )
                                        ],
                                      )),

                                  // Text(
                                  //   " Details",
                                  //   style: TextStyle(
                                  //     color: Colors.redAccent,
                                  //     fontSize: 15,
                                  //   ),
                                  // ),
                                  // IconButton(onPressed: (){
                                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>WeaklyWeather()));
                                  // },
                                  //
                                  //     icon: Icon(Icons.arrow_forward,color: Colors.white,size: 15,))
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
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
                      ],
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Please currect city name"),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              future: apiService.getWeatherData(searchText),
            ),
          ),
        ),
      ),
    );
  }
}
