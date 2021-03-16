import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/models/meetup.dart';
import 'package:flutter_meetuper/src/screens/meetup_detail_screen.dart';
import 'package:flutter_meetuper/src/services/meetup_api_service.dart';

class MeetupHomeScreen extends StatefulWidget {
  static final String route = '/meetupHomeScreen';
  final MeetupApiService api = MeetupApiService();

  @override
  State<StatefulWidget> createState() => _MeetupHomeScreenState();
}

class _MeetupHomeScreenState extends State<MeetupHomeScreen> {
  List<Meetup> meetups = [];

  @override
  void initState() {
    super.initState();
    _fetchMeetups();
  }

  _fetchMeetups() async {
    var res = await widget.api.fetchMeetups();
    setState(() => this.meetups = res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [_MeetupTitle(), _MeetupList(meetups)]),
        appBar: AppBar(title: Text('Home')),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.bathtub_rounded), onPressed: () => {}));
  }
}

class _MeetupTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(20.0),
        child: Text('Featured meetup',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
      );
}

class _MeetupCard extends StatelessWidget {
  final Meetup meetup;

  _MeetupCard({@required this.meetup});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(meetup.image),
          radius: 20.0,
        ),
        title: Text(meetup.title),
        subtitle: Text(meetup.description),
      ),
      ButtonBar(
        children: [
          TextButton(
              child: Text('Visit meetup'),
              onPressed: () => Navigator.pushNamed(
                  context, MeetupDetailScreen.route,
                  arguments: meetup.id)),
          TextButton(child: Text('Favorite'), onPressed: () => {})
        ],
      ),
    ]));
  }
}

class _MeetupList extends StatelessWidget {
  final List<Meetup> meetupsList;

  _MeetupList(this.meetupsList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _MeetupCard(meetup: meetupsList[index]);
            },
            itemCount: meetupsList.length));
  }
}
