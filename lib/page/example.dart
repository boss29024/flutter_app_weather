import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class example extends StatelessWidget {
  const example({Key? key}) : super(key: key);

  void getData() async {
    final url =
        Uri.parse("https://weather.com/th-TH/weather/today/l/THXX0002:1:TH");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Container(),
    );
  }
}
