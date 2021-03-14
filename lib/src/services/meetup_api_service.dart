import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter_meetuper/src/model/meetup.dart';
import 'package:http/http.dart';

class MeetupApiService {
  final String url = Platform.isIOS
      ? 'http://localhost:3001/api/v1/meetups'
      : 'http://10.0.2.2:3001/api/v1/meetups';
  static final MeetupApiService _instance = MeetupApiService._internal();

  factory MeetupApiService() => _instance;

  MeetupApiService._internal();

  Future<List<Meetup>> fetchMeetups() async {
    var response = await get(url);
    List parsed = jsonDecode(response.body);
    return parsed.map((v) => Meetup.fromJSON(v)).toList();
  }
}
