import 'dart:convert';

import 'package:flutter_meetuper/src/models/post.dart';

class PostApiProvider {
  static final PostApiProvider _instance = PostApiProvider._internal();

  PostApiProvider._internal();

  factory PostApiProvider() => _instance;

  Future<List<Post>> fetchPosts() async {
    // var uri = Uri.https('jsonplaceholder.typicode.com', '/posts');
    // var r = await get(uri);
    // List<dynamic> parsed = jsonDecode(r.body);
    // return parsed.map((pp) => Post.fromJson(pp)).take(3).toList();
  }
}
