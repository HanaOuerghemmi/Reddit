import 'package:flutter/material.dart';
import 'package:redit/data.dart';
import 'package:redit/screens/widgets/video_post_widget.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: Colors.grey[900],
        title: Text(
          'Post Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.more_horiz,
            color: Colors.white,
          )
        ],
      ),
      body: VideoPost(
        user: users[0],
        post: posts[0],
      ),
    );
    // VideoCard(post: posts[0]));
  }
}
