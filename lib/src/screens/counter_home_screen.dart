import 'package:flutter/material.dart';

class CounterHomeScreen extends StatefulWidget {
  final String _title;

  CounterHomeScreen(this._title);

  @override
  _CounterHomeScreenState createState() => _CounterHomeScreenState();
}

class _CounterHomeScreenState extends State<CounterHomeScreen> {
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
      bottomNavigationBar: _BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Press here to increment...',
        child: Icon(Icons.add_comment),
      ),
      appBar: AppBar(title: Text(widget._title)),
    );
  }
}

class _BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<_BottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ]);
  }
}
