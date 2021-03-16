import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/screens/login_screen.dart';
import 'package:flutter_meetuper/src/screens/meetup_detail_screen.dart';
import 'package:flutter_meetuper/src/screens/meetup_home_screen.dart';
import 'package:flutter_meetuper/src/screens/register_screen.dart';

void main() => runApp(MeetuperApp());

class MeetuperApp extends StatelessWidget {
  final String _title = 'Meetuper Application';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        //home: CounterHomeScreen(_title),
        //home: PostScreen(),
        home: LoginScreen(),
        routes: {
          MeetupDetailScreen.route: (context) => MeetupDetailScreen(),
          RegisterScreen.route: (context) => RegisterScreen(),
          LoginScreen.route: (context) => LoginScreen(),
          MeetupHomeScreen.route: (context) => MeetupHomeScreen()
        }
        /* onGenerateRoute: (RouteSettings settings) {
          if (settings.name == MeetupDetailScreen.route) {
            final String meetupId = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => MeetupDetailScreen(meetupId: meetupId));
          }
        }*/
        );
  }
}
