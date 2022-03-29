import 'package:flutter/material.dart';

class CardhourlyWeather extends StatelessWidget {
  const CardhourlyWeather(
      {Key? key, this.time = '16.39', this.temp = '0.0', this.icon = 'LOL'})
      : super(key: key);

  final String time;
  final String temp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    return Container(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time),
            Text('${temp}'),
            Text(icon,style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}
