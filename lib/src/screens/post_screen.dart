import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/widgets/bootom_navigation.dart';
import 'package:http/http.dart';

class PostScreen extends StatefulWidget {
  PostScreen();

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<dynamic> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  void _fetchPosts() {
    var uri = Uri.https('jsonplaceholder.typicode.com', '/posts');
    get(uri).then((r) => setState(() => _posts = jsonDecode(r.body)));
  }

  @override
  Widget build(BuildContext context) {
    print('I am calling build...');
    return Scaffold(
      body: ListView(
          children: _posts
              .map((post) => ListTile(
                  title: Text(post['title']), subtitle: Text(post['body'])))
              .toList()),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Press here to increment...',
        child: Icon(Icons.add_comment),
      ),
    );
  }
}
