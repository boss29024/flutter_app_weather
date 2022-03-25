import 'package:flutter/material.dart';
import 'package:flutter_app_weather_forecast/page/HomePage.dart';
import 'package:flutter_app_weather_forecast/page/Setting.dart';
import 'package:flutter_app_weather_forecast/page/example.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/setting': (context) => SettingPage(),
        '/example': (context) => example(),
      },
    );
  }
}
