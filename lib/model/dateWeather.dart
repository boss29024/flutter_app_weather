import 'package:dio/dio.dart';

class dataWeather {
  Future<void> currentWeather() async {
    var dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/current.json?key=18d7b9d6de11454aaea54936222503&q=bangkok&aqi=yes');

    print(response.data);
  }

  Future<void> forecastWeekly() async {
    var dio = Dio();
    final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=18d7b9d6de11454aaea54936222503&q=bangkok&q=bangkok&days=7&aqi=yes&alerts=no');

    print(response.data);
  }

}
