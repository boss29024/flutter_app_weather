import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather_forecast/model/currentWeather.dart';
import 'package:flutter_app_weather_forecast/model/forecastWeekly.dart';
import 'package:flutter_app_weather_forecast/widget/cardHourly.dart';
import 'package:flutter_app_weather_forecast/widget/cardWeekly.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dataCurrent = CurrentWeather();
  var dataForecast = ForecastWeekly();
  void getCurrentWeather() async {
    var dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/current.json?key=18d7b9d6de11454aaea54936222503&q=bangkok&aqi=yes');
    if (response.statusCode == 200) {
      setState(() {
        dataCurrent = CurrentWeather.fromJson(response.data);
      });
    } else {
      print('error');
    }
  }

  Future<void> getForecast() async {
    var dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=18d7b9d6de11454aaea54936222503&q=bangkok&q=bangkok&days=7&aqi=yes&alerts=no');

    if (response.statusCode == 200) {
      setState(() {
        dataForecast = ForecastWeekly.fromJson(response.data);
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

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text('WeatherApp'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/example');
                },
                icon: Icon(Icons.settings))
          ],
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
              _hourlyPrediction(),
              SizedBox(
                height: (heightDevice / 100) * 4,
              ),
              _weeklyPrediction(),
            ],
          ),
        ));
  }

  final itmesWeek = [
    '1',
    '2',
    '3',
    '1',
    '2',
    '3',
    '1',
  ];

  _weeklyPrediction() {
    return Container(
      height: 140,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white))),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: itmesWeek.length,
          itemBuilder: (context, index) {
            return Container(height: 50, child: CardWeeklyWeather());
          }),
    );
  }

  final itmesHour = [
    '1',
    '2',
    '3',
    '1',
    '2',
    '3',
    '1',
    '2',
    '3',
    '1',
    '2',
    '3',
  ];

  _hourlyPrediction() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.white),
              bottom: BorderSide(color: Colors.white))),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itmesHour.length,
          itemBuilder: (context, index) {
            return Container(
                width: 50,
                child: CardhourlyWeather(
                  time: '${dataForecast.current}',
                ));
          }),
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
          '${dataCurrent.location?.localtime}',
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
          '${dataCurrent.location?.region}',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  _temprature() {
    return Text(
      '${dataCurrent.current?.tempC}',
      style: TextStyle(fontSize: 80, fontWeight: FontWeight.w100),
    );
  }

  _cloudIcon() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('${dataCurrent.current?.condition!.icon}'),
          ],
        ));
  }
}
