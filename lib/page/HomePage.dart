import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('WeatherApp'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/setting');
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _cloudIcon(),
              _temprature(),
              _location(),
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
            return Container(
                height: 50,
                child: Card(
                  child: Center(
                    child: Text('${itmesWeek[index]}'),
                  ),
                ));
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
                child: Card(
                  child: Center(
                    child: Text('${itmesHour[index]}'),
                  ),
                ));
          }),
    );
  }

  _date() {
    return Row(
      children: [
        Text('Today'),
        SizedBox(
          width: 10,
        ),
        Text('24.03.2022')
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
        Text('City')
      ],
    );
  }

  _temprature() {
    return Text(
      '-10',
      style: TextStyle(fontSize: 80, fontWeight: FontWeight.w100),
    );
  }

  _cloudIcon() {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Icon(
        Icons.cloud,
        size: 80,
      ),
    );
  }
}
