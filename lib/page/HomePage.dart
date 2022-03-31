import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather_forecast/model/currentWeather.dart';

import 'package:flutter_app_weather_forecast/model/forecastDaily.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dateTime = DateTime.now();
  var dataCurrent = CurrentWeather();
  var forecastDaily = ForecastDaily();
  bool isloading = true;

  void getCurrentWeather() async {
    var dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=18d7b9d6de11454aaea54936222503&q=bangkok&days=7&aqi=no&alerts=no');
    if (response.statusCode == 200) {
      setState(() {
        dataCurrent = CurrentWeather.fromJson(response.data);
        isloading = false;
      });
    } else {
      print('error');
    }
  }

  void getForecast() async {
    var dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=18d7b9d6de11454aaea54936222503&q=bangkok&days=7&aqi=no&alerts=no');

    if (response.statusCode == 200) {
      setState(() {
        forecastDaily = ForecastDaily.fromJson(response.data);
        isloading = false;
      });
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
    getForecast();
  }

  dynamic _weeklyPrediction() {
    return Container(
      height: 150,
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
                          : '${dateTime.day}:${dateTime.month}:${dateTime.year}'),
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

  dynamic _hourlyPrediction() {
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

  _location() {
    return Row(
      children: [
        Icon(Icons.place),
        SizedBox(
          width: 10,
        ),
        Text(
          dataCurrent.location?.region != null
              ? '${dataCurrent.location?.region}'
              : 'bangkok',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  _date() {
    return Row(
      children: [
        Text(
          'Today',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          dataCurrent.location?.localtime != null
              ? '${dataCurrent.location?.localtime}'
              : '${dateTime.day}:${dateTime.month}:${dateTime.year}',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  _temprature() {
    return Text(
      dataCurrent.current?.tempC != null
          ? '${dataCurrent.current?.tempC}'
          : '0.0',
      style: TextStyle(fontSize: 80, fontWeight: FontWeight.w100),
    );
  }

  _cloudIcon() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(
              dataCurrent.current?.condition!.icon != null
                  ? 'http:${dataCurrent.current?.condition!.icon}'
                  : 'http://cdn.weatherapi.com/weather/64x64/day/116.png',
              fit: BoxFit.contain,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text('WeatherApp'),
        ),
        body: isloading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _cloudIcon(),
                    _temprature(),
                    _location(),
                    SizedBox(
                      height: (heightDevice / 100) * 2,
                    ),
                    _date(),
                    SizedBox(
                      height: (heightDevice / 100) * 5,
                    ),
                    _hourlyPrediction(),
                    SizedBox(
                      height: (heightDevice / 100) * 5,
                    ),
                    _weeklyPrediction(),
                  ],
                ),
              ));
  }
}
