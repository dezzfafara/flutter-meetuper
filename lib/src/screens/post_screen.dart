import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meetuper/src/model/post.dart';
import 'package:flutter_meetuper/src/services/post_api_provider.dart';
import 'package:flutter_meetuper/src/widgets/bootom_navigation.dart';

class PostScreen extends StatefulWidget {
  final PostApiProvider _api = PostApiProvider();

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  _fetchPosts() async {
    List<Post> posts = await widget._api.fetchPosts();
    setState(() => _posts = posts);
  }

  _addPost() {
    final id = faker.randomGenerator.integer(9999);
    final title = faker.food.dish();
    final body = faker.food.cuisine();
    final newPost = Post(title, body, id);

    setState(() => _posts.add(newPost));
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedPost(
        child: _PostList(), posts: _posts, createPost: _addPost);
  }
}

class _PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final posts = _InheritedPost.of(context).posts;

    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length * 2,
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) {
            return Divider();
          }

          final index = i ~/ 2;

          return ListTile(
              title: Text(posts[index].title),
              subtitle: Text(posts[index].body));
        },
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: _PostButton(),
      appBar: AppBar(title: Text('Posts')),
    );
  }
}

class _InheritedPost extends InheritedWidget {
  final Widget child;

  final List<Post> posts;
  final Function createPost;

  _InheritedPost(
      {@required this.child, @required this.posts, @required this.createPost})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_InheritedPost>();
}

class _PostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final createPost = _InheritedPost.of(context).createPost;
    return FloatingActionButton(
        onPressed: createPost, tooltip: 'Add Post', child: Icon(Icons.add));
  }
}
