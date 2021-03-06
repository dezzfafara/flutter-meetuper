import 'dart:io' show Platform;

import 'package:dio/dio.dart';
import 'package:flutter_meetuper/src/models/meetup.dart';

class MeetupApiService {
  final Dio dio = Dio();
  final String url = Platform.isIOS
      ? 'http://localhost:3001/api/v1/'
      : 'http://10.0.2.2:3001/api/v1/';
  static final MeetupApiService _instance = MeetupApiService._internal();

  factory MeetupApiService() => _instance;

  MeetupApiService._internal();

  Future<List<Meetup>> fetchMeetups() async {
    var response = await dio.get(url + 'meetups');
    List parsed = response.data;
    return parsed.map((v) => Meetup.fromJSON(v)).toList();
  }

  Future<Meetup> fetchMeetupById(String id) async {
    var response = await dio.get(url + 'meetups/$id');
    var meetup = response.data;
    return Meetup.fromJSON(meetup);
  }
}
