import 'package:flutter/material.dart';

class CardWeeklyWeather extends StatelessWidget {
  const CardWeeklyWeather(
      {Key? key,
      this.days = '28.03.2022',
      this.maxTemp = '0.0',
      this.avgTemp = '0.0',
      this.icon = ''})
      : super(key: key);

  final String days;
  final String maxTemp;
  final String avgTemp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$icon'),
            SizedBox(
              width: (widthDevice / 100) * 1,
            ),
            Text('${days}'),
            SizedBox(
              width: (widthDevice / 100) * 50,
            ),
            Text('maxTemp:${maxTemp}/avgTemp:${avgTemp}')
          ],
        ),
      ),
    );
  }
}
