import 'package:flutter/material.dart';

void main() => runApp(MeetuperApp());

class MeetuperApp extends StatelessWidget {
  final String _title = 'Meetuper Application';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: CounterHomeScreen(_title));
  }
}

class CounterHomeScreen extends StatelessWidget {
  final String _title;

  CounterHomeScreen(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to $_title, lets increment something!',
                textDirection: TextDirection.ltr),
            Text(
              'Click counter: 0',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 30.0),
            )
          ],
        ),
      ),
      appBar: AppBar(title: Text(_title)),
    );
  }
}
