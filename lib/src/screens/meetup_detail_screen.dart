import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/models/meetup.dart';
import 'package:flutter_meetuper/src/services/meetup_api_service.dart';
import 'package:flutter_meetuper/src/widgets/bottom_navigation.dart';

class MeetupDetailScreen extends StatefulWidget {
  final MeetupApiService api = MeetupApiService();
  static final String route = '/meetupDetails';
  final String meetupId;

  MeetupDetailScreen({this.meetupId});

  @override
  State<StatefulWidget> createState() => _MeetupDetailScreenState();
}

class _MeetupDetailScreenState extends State<MeetupDetailScreen> {
  Meetup meetup;

  @override
  void initState() {
    super.initState();
    _fetchMeetupById();
  }

  _fetchMeetupById() async {
    var res = await widget.api.fetchMeetupById(widget.meetupId);
    setState(() => this.meetup = res);
  }

  _buildBody() {
    return meetup != null
        ? ListView(
            children: [
              HeaderSection(meetup: meetup),
              TitleSection(meetup: meetup),
              AdditionalInfoSection(meetup: meetup),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(meetup.description)),
              )
            ],
          )
        : Container(width: 0.0, height: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      appBar: AppBar(
        title: Text('Meetup details...'),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final Meetup meetup;

  HeaderSection({@required this.meetup});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.network(meetup.image,
            width: width, height: 250.0, fit: BoxFit.cover),
        Container(
            width: width,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://cdn.dribbble.com/users/304574/screenshots/6222816/male-user-placeholder.png'),
                  ),
                  title: Text(meetup.title,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  subtitle: Text(
                    meetup.shortInfo,
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ))
      ],
      alignment: AlignmentDirectional.bottomStart,
    );
  }
}

class TitleSection extends StatelessWidget {
  final Meetup meetup;

  TitleSection({@required this.meetup});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(meetup.title,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  meetup.shortInfo,
                  style: TextStyle(color: Colors.grey.shade400),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          Icon(
            Icons.people,
            color: Colors.blue[500],
          ),
          Text(' ${meetup.joinedPeopleCount} People')
        ],
      ),
    );
  }
}

class AdditionalInfoSection extends StatelessWidget {
  final Meetup meetup;

  AdditionalInfoSection({@required this.meetup});

  _capitalizeFirst(String value) => value != null && value.isNotEmpty
      ? value[0].toUpperCase() + value.substring(1)
      : '';

  _buildColumn(String label, String text, Color color) {
    return Column(children: [
      Text(label,
          style: TextStyle(
              fontSize: 13.0, fontWeight: FontWeight.w400, color: color)),
      Text(text,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w500, color: color))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Row(children: [
      _buildColumn('Category', _capitalizeFirst(meetup.category.name), color),
      _buildColumn('from'.toUpperCase(), meetup.timeFrom, color),
      _buildColumn('to'.toUpperCase(), meetup.timeTo, color),
    ], mainAxisAlignment: MainAxisAlignment.spaceEvenly);
  }
}
