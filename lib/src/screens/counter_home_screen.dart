import 'package:flutter/material.dart';

class CounterHomeScreen extends StatefulWidget {
  final String _title;

  CounterHomeScreen(this._title);

  @override
  CounterHomeScreenState createState() => CounterHomeScreenState();
}

class CounterHomeScreenState extends State<CounterHomeScreen> {
  int _counter = 0;

  _increment() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to ${widget._title}, lets increment something!',
                textDirection: TextDirection.ltr),
            Text(
              'Click counter: $_counter',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 30.0),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Press here to increment...',
        child: Icon(Icons.add_comment),
      ),
      appBar: AppBar(title: Text(widget._title)),
    );
  }
}
