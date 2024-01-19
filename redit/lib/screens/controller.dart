import 'package:get/get.dart';
import 'package:redit/data.dart';
import 'package:redit/data.dart';
import 'package:redit/model.dart';

class DataController extends GetxController {

  // Function to get all posts
  List<User> getAllUsers() {
    return users;
  }

  // Function to get all posts
  List<Post> getAllPosts() {
    List<Post> allPosts = [];
    for (var post in posts) {
      allPosts.addAll(posts);
    }
    return allPosts;
  }

//?update number likes
void updateLikesInPost(
  {required String postId, 
  
  required int newLikes}
  ) {

      Post? post = posts.firstWhere((post) => post.id == postId, );
      if (post != null) {
        post.likes = newLikes;
        update(); 
      }
    }
 void updateLikesInComment(
  {required String commentId, 
  
  required int newLikes}
  ) {

     
    }
//?add commenter
  void addCommentToPost( String postId, Comment comment) {
    Post? post = posts.firstWhere(
      (post) => post.id == postId,
    );
    if (post != null) {
      post.comments.add(comment);
      update();
    }
  }
}