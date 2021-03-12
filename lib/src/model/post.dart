class Post {
  final String _title;
  final String _body;
  final int _id;

  Post(this._title, this._body, this._id);

  Post.fromJson(Map<String, dynamic> json)
      : _title = json['title'],
        _body = json['body'],
        _id = json['id'];

  String get title => _title;

  String get body => _body;

  int get id => _id;
}
