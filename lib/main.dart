import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/screens/meetup_detail_screen.dart';
import 'package:flutter_meetuper/src/screens/post_screen.dart';

void main() => runApp(MeetuperApp());

class MeetuperApp extends StatelessWidget {
  final String _title = 'Meetuper Application';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      //home: CounterHomeScreen(_title),
      home: PostScreen(),
      routes: {MeetupDetailScreen.route: (context) => MeetupDetailScreen()},
    );
  }
}
