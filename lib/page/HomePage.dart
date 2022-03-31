import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather_forecast/model/currentWeather.dart';
import 'package:flutter_app_weather_forecast/page/ForecastWeather.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dateTime = DateTime.now();
  var dataCurrent = CurrentWeather();

  void getCurrentWeather() async {
    var dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=18d7b9d6de11454aaea54936222503&q=bangkok&days=7&aqi=no&alerts=no');
    if (response.statusCode == 200) {
      setState(() {
        dataCurrent = CurrentWeather.fromJson(response.data);
      });
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text('WeatherApp'),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _cloudIcon(),
              _temprature(),
              _location(),
              SizedBox(
                height: (heightDevice / 100) * 1,
              ),
              _date(),
              SizedBox(
                height: (heightDevice / 100) * 4,
              ),
              ForecastWearther()
            ],
          ),
        ));
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
}
