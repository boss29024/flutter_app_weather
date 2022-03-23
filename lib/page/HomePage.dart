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
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: (heightDevice / 100) * 2,
            ),
            Container(
              child: Row(children: [Icon(Icons.add), Text('บ้านหนองไม้แดง')]),
            ),
            SizedBox(
              height: (heightDevice / 100) * 5,
            ),
            Center(
              child: Column(children: [
                Text('31c'),
                Text('มีเมฆ'),
              ]),
            ),
            SizedBox(
              height: (heightDevice / 100) * 5,
            ),
            Card(
              child: Container(
                  child: Row(
                children: [],
              )),
            )
          ],
        ),
      ),
    );
  }
}
