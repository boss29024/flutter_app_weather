import 'package:flutter/material.dart';
import 'package:flutter_app_weather_forecast/page/HomePage.dart';
import 'package:flutter_app_weather_forecast/page/Setting.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        footerTriggerDistance: 15,
        dragSpeedRatio: 0.91,
        headerBuilder: () => MaterialClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        enableLoadingWhenNoData: false,
        enableRefreshVibrate: false,
        enableLoadMoreVibrate: false,
        shouldFooterFollowWhenNotFull: (state) {
          // If you want load more with noMoreData state ,may be you should return false
          return false;
        },
        child: MaterialApp(
          title: 'Weather App',
          theme: ThemeData(
              primarySwatch: Colors.blue, brightness: Brightness.dark),
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/setting': (context) => SettingPage(),
          },
        ));
  }
}
