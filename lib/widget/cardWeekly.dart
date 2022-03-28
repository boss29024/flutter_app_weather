import 'package:flutter/material.dart';

class CardWeeklyWeather extends StatelessWidget {
  const CardWeeklyWeather(
      {Key? key,
      this.days = '28.03.2022',
      this.maxTemp = 0.0,
      this.lowTemp = 0.0})
      : super(key: key);

  final String days;
  final double maxTemp;
  final double lowTemp;

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: (widthDevice / 100) * 1,
            ),
            Text('${days}'),
            SizedBox(
              width: (widthDevice / 100) * 50,
            ),
            Text('${maxTemp}/${lowTemp}')
          ],
        ),
      ),
    );
  }
}
