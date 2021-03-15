import 'package:faker/faker.dart';
import 'package:flutter_meetuper/src/models/post.dart';
import 'package:flutter_meetuper/src/services/post_api_provider.dart';
import 'package:scoped_model/scoped_model.dart';

class PostModel extends Model {
  List<Post> posts;
  final testingState = 'Testing State';

  final PostApiProvider _api = PostApiProvider();

  PostModel() {
    _fetchPosts();
  }

  _fetchPosts() async {
    this.posts ??= [];
    this.posts = await _api.fetchPosts();
    notifyListeners();
  }

  addPost() {
    final id = faker.randomGenerator.integer(9999);
    final title = faker.food.dish();
    final body = faker.food.cuisine();
    final newPost = Post(title, body, id);

    posts.add(newPost);
    notifyListeners();
  }
}
