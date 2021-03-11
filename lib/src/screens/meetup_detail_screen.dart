import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/widgets/bootom_navigation.dart';

class MeetupDetailScreen extends StatelessWidget {
  static final String route = '/meetupDetails';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('It is meetup details screen...'),
      appBar: AppBar(
        title: Text('Meetup details...'),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
