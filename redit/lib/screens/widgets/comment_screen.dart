import 'package:flutter/material.dart';
import 'package:redit/model.dart';
import 'package:redit/screens/widgets/comment_card.dart';


@override
  Widget bottomCommentSheet(Post post) {
    return DraggableScrollableSheet(
       expand: true,
      snap: true,
     
      initialChildSize: 0.9,
      minChildSize: 0.9,
      maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) {
            return 
          
                  Container(
                    child: ListView.builder(
                      keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.manual,
                      controller: scrollController,
                      itemCount: post.comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return 
                        CommentCard(comment: post.comments[index]);
                       // ListTile(title: Text('comment $index', style: textStyleText,), );
                      },
                                
                    ),
                  );
            
           
  }
    );
  }
