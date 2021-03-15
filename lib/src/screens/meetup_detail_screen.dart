import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/model/meetup.dart';
import 'package:flutter_meetuper/src/services/meetup_api_service.dart';
import 'package:flutter_meetuper/src/widgets/bootom_navigation.dart';

class MeetupDetailScreen extends StatefulWidget {
  final MeetupApiService api = MeetupApiService();
  static final String route = '/meetupDetails';
  final String meetupId;

  MeetupDetailScreen({this.meetupId});

  @override
  State<StatefulWidget> createState() => _MeetupDetailScreenState();
}

class _MeetupDetailScreenState extends State<MeetupDetailScreen> {
  Meetup _meetup;

  @override
  void initState() {
    super.initState();
    _fetchMeetupById();
  }

  _fetchMeetupById() async {
    var res = await widget.api.fetchMeetupById(widget.meetupId);
    setState(() => _meetup = res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(_meetup.id),
          Text(_meetup.title),
          Text(_meetup.description),
        ],
      ),
      appBar: AppBar(
        title: Text('Meetup details...'),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
