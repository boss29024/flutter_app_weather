import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_weather_forecast/model/forecastWeekly.dart';
import 'package:flutter_app_weather_forecast/widget/cardHourly.dart';
import 'package:flutter_app_weather_forecast/widget/cardWeekly.dart';

class ForecastWearther extends StatefulWidget {
  ForecastWearther({Key? key}) : super(key: key);

  @override
  State<ForecastWearther> createState() => _ForecastWeartherState();
}

class _ForecastWeartherState extends State<ForecastWearther> {
  List<Day> days = [];
  List<Hour> hour = [];
  List<Forecastday> forecastDay = [];
  final datetime = DateTime.now();
  var dataForecast = ForecastWeekly();
  Future<void> getForecast() async {
    var dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=18d7b9d6de11454aaea54936222503&q=bangkok&days=7&aqi=no&alerts=no');

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
          itemCount: forecastDay.length,
          itemBuilder: (context, index) {
            return Container(
                height: 50,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        forecastDay[index].astro?.sunrise != null
                            ? '${forecastDay[index].astro?.sunrise}'
                            : '',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                          '${datetime.day}:${datetime.month}:${datetime.year}'),
                      SizedBox(
                        width: 50,
                      ),
                      Text('maxTemp:'),
                      Text(days[index].maxtempC != null
                          ? '${days[index].maxtempC}'
                          : '0.0'),
                      Text('/avgTemp:'),
                      Text(days[index].avgtempC != null
                          ? '${days[index].avgtempC}'
                          : '0.0')
                    ],
                  ),
                ));
          }),
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
          itemCount: hour.length,
          itemBuilder: (context, index) {
            return Container(
                width: 50,
                child: CardhourlyWeather(
                  time: '${datetime.hour}.00',
                  temp: '${dataForecast.current?.tempC}',
                ));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    return Container(
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
    );
  }
}