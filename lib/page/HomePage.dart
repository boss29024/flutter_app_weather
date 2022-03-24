import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text('Weather App')),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: (heightDevice / 100) * 2,
            ),
            Container(
              child: Row(children: [
                Icon(Icons.add),
                SizedBox(
                  width: (widthDevice / 100) * 25,
                ),
                Text(
                  'บ้านหนองไม้แดง',
                  style: TextStyle(fontSize: 24),
                ),
              ]),
            ),
            SizedBox(
              height: (heightDevice / 100) * 15,
            ),
            Center(
              child: Column(children: [
                Text(
                  '31c',
                  style: TextStyle(fontSize: 108),
                ),
                Text('มีเมฆ'),
              ]),
            ),
            SizedBox(
              height: (heightDevice / 100) * 5,
            ),
            Container(
              child: Row(
                children: [
                  Column(
                    children: [Text('ขณะนี้'), Text('31c')],
                  )
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                  child: Column(
                children: [Text('พยากรณ์ 5วัน')],
              )),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Example'))
          ],
        ),
      ),
    );
  }
}
