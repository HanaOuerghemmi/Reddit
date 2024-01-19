

class User {
  String id;
  String username;
  String imageUserUrl;


  User({
    required this.id,
    required this.username,
    required this.imageUserUrl,

  });
}

class Comment {
  String id;
  User user;
  String text;
  int likes;

  Comment({
    required this.id,
    required this.user,
    required this.text,
    required this.likes,

  });
}

class Post {
  String id;
  User user;
  String description;
  String videoUrl;
  int likes;

  List<Comment> comments;

  Post({
    required this.id,
    required this.user,
    required this.description,
    required this.videoUrl,
    required this.likes,

    required this.comments,
  });
}