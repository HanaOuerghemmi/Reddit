
import 'package:flutter/material.dart';
import 'package:redit/consts/helper_text_style.dart';
import 'package:redit/model.dart';
import 'package:redit/screens/widgets/avatar.dart';
import 'package:redit/screens/widgets/info_widget.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;

  CommentCard({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
          color: Colors.black12,
          elevation: 1,
          margin: EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            children: [
              // avatar
              AvatarWidgets(user: comment.user),

              //comment
              Container(
                  padding: EdgeInsets.all(10),
                  width: double.maxFinite,
                  child: Text(
                    comment.text,
                    style: textStyleText,
                  )),
              InfoCommentWidget(
                comment: comment,
              )
              //icons
            ],
          )),
    );
  }
}
