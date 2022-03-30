import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather_forecast/model/forecastDaily.dart';
import 'package:intl/intl.dart';

import 'dart:convert' as convert;

class ForecastWearther extends StatefulWidget {
  ForecastWearther({Key? key}) : super(key: key);

  @override
  State<ForecastWearther> createState() => _ForecastWeartherState();
}

class _ForecastWeartherState extends State<ForecastWearther> {
  final datetime = DateTime.now();
  var forecastDaily = ForecastDaily();

  Future<void> getForecast() async {
    var dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=18d7b9d6de11454aaea54936222503&q=bangkok&days=7&aqi=no&alerts=no');

    if (response.statusCode == 200) {
      setState(() {
        forecastDaily = ForecastDaily.fromJson(response.data);
      });
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getForecast();
  }

  _weeklyPrediction() {
    return Container(
      height: 140,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white))),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 50,
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        forecastDaily.forecast!.forecastday![index].day
                                    ?.condition!.icon !=
                                null
                            ? 'http:${forecastDaily.forecast!.forecastday![index].day?.condition!.icon}'
                            : 'http://cdn.weatherapi.com/weather/64x64/day/116.png',
                      ),
                      Text(forecastDaily.forecast!.forecastday![index].date !=
                              null
                          ? '${forecastDaily.forecast!.forecastday![index].date}'
                          : '${datetime.day}:${datetime.month}:${datetime.year}'),
                      Text(
                        forecastDaily.forecast!.forecastday![index].day
                                    ?.avgtempC !=
                                null
                            ? 'avgTemp:${forecastDaily.forecast!.forecastday![index].day?.avgtempC}'
                            : 'avgTemp: 0.0',
                      )
                    ],
                  ),
                ),
              ));
        },
        itemCount: forecastDaily.forecast!.forecastday!.length,
      ),
    );
  }

  _hourlyPrediction() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white))),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm").parse(
                forecastDaily.forecast!.forecastday![0].hour![index].time
                    .toString());
            String formattedTime = DateFormat('HH:mm').format(tempDate);
            return Container(
                width: 50,
                child: Card(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${formattedTime}'),
                        Text(
                          forecastDaily.forecast!.forecastday![0].hour![index]
                                      .tempC !=
                                  null
                              ? '${forecastDaily.forecast!.forecastday![0].hour![index].tempC}'
                              : '0.0',
                        ),
                        Image.network(
                          forecastDaily.forecast!.forecastday![0].hour![index]
                                      .condition?.icon !=
                                  null
                              ? 'http:${forecastDaily.forecast!.forecastday![0].hour![index].condition?.icon}'
                              : 'http://cdn.weatherapi.com/weather/64x64/day/116.png',
                        ),
                      ],
                    ),
                  ),
                ));
          },
          itemCount: forecastDaily.forecast!.forecastday![0].hour!.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: (heightDevice / 100) * 2,
            ),
            _hourlyPrediction(),
            SizedBox(
              height: (heightDevice / 100) * 4,
            ),
            _weeklyPrediction(),
          ],
        ),
      ),
    );
  }
}
