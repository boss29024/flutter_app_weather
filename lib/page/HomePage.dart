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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                  children: [Icon(Icons.add), Text('บ้านหนองไม้แดง')]),
            ),
            Center(
              child: Column(children: [Text('31c'), Text('มีเมฆ')]),
            )
          ],
        ),
      ),
    );
  }
}
