import 'package:flutter/material.dart';

class CardhourlyWeather extends StatelessWidget {
  const CardhourlyWeather({
    Key? key,
    this.time = '16.39',
    this.temp = '0.0',
  }) : super(key: key);

  final String time;
  final String temp;

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
          ],
        ),
      ),
    );
  }
}
