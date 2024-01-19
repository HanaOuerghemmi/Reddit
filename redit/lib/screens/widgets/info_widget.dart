import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redit/consts/colors.dart';
import 'package:redit/consts/helper_padding.dart';
import 'package:redit/consts/helper_text_style.dart';
import 'package:redit/model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redit/screens/controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redit/screens/widgets/delete_pop.dart';


//icons for post

class InfoIconsWidgets extends StatefulWidget {
  final Post post;
  const InfoIconsWidgets({super.key, required this.post});

  @override
  State<InfoIconsWidgets> createState() => _InfoIconsWidgetsState();
}

class _InfoIconsWidgetsState extends State<InfoIconsWidgets> {
  bool islike = false;
  bool isDlike = false;
  double containerHeight = 50.0;
  @override
  void initState() {
    islike;
    isDlike;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();

    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //??like
          IconButton(
            onPressed: () {
              setState(() {
                int newLikes = widget.post.likes + 1;
                dataController.updateLikesInPost(
                    postId: widget.post.id, newLikes: newLikes);
                widget.post.likes = newLikes;

                islike = !islike;
                isDlike = false;
                print('islike :  ${islike}');
                print('isDlike :  ${isDlike}');
              });
            },
            icon: islike
                ? SvgPicture.asset('assets/svg/up.svg',
                    width: 26, height: 26, color: Colors.red)
                : SvgPicture.asset('assets/svg/up_empty.svg',
                    width: 26, height: 26, color: whiteColor),
            // Icon(
            //   Icons.arrow_upward_sharp,
            //   color: islike ?  Colors.red : whiteColor ,
            // ),
          ),
          Text(
            widget.post.likes.toString(),
            style: textStyleTextBold,
          ),

// Dislike button
          IconButton(
              onPressed: () {
                setState(() {
                  int newLikes = widget.post.likes - 2;
                  dataController.updateLikesInPost(
                      postId: widget.post.id, newLikes: newLikes);
                  widget.post.likes = newLikes;
                  islike = false; // Reset like state
                  isDlike = !isDlike;
                  print('islike :  ${islike}');
                  print('isDlike :  ${isDlike}');
                });
              },
              icon: isDlike
                  ? SvgPicture.asset('assets/svg/down.svg',
                      width: 26, height: 26, color: Colors.blue[200])
                  : SvgPicture.asset('assets/svg/down_empty.svg',
                      width: 26, height: 26, color: whiteColor)

              // Icon(
              //   Icons.arrow_downward,
              //   color: isDlike ? Colors.blueAccent  : whiteColor ,
              // ),
              ),
          Icon(Icons.chat_bubble_outline_outlined, color: whiteColor),
          Text(widget.post.comments.length.toString(),
              style: textStyleTextBold),
          smallPaddingVert,
          Icon(Icons.file_upload_outlined, color: whiteColor),
        ],
      ),
    );
  }
}
///icons for comment
class InfoCommentWidget extends StatefulWidget {
  final Comment comment;
  const InfoCommentWidget({super.key, required this.comment});

  @override
  State<InfoCommentWidget> createState() => _InfoCommentWidgetState();
}

class _InfoCommentWidgetState extends State<InfoCommentWidget> {
  bool islike = false;
  bool isDlike = false;
  @override
  void initState() {
    widget.comment.likes;
    islike;
    isDlike;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: (){
              showDeleteConfirmation(context);
            },
           icon:Icon(Icons.more_horiz, color: whiteColor),),
          mediumPaddingHor,
          Icon(Icons.reply_sharp, color: whiteColor),
          Text(
            'replay',
            style: textStyleText,
          ),
          mediumPaddingHor,

          IconButton(
            onPressed: () {
              setState(() {
                int newLikes = widget.comment.likes + 1;
                widget.comment.likes = newLikes;
                islike = !islike;
                isDlike = false;
                print('islike :  ${islike}');
                print('isDlike :  ${isDlike}');
              });
            },
            icon:
             islike
                ? SvgPicture.asset('assets/svg/up.svg',
                    width: 20, height: 20, color: Colors.red)
                : SvgPicture.asset('assets/svg/up_empty.svg',
                    width: 20, height: 20, color: whiteColor),
            //  Icon(
            //   Icons.arrow_upward_sharp,
            //   color: islike ? Colors.red : whiteColor,
            // ),
          ),
          Text(
            widget.comment.likes.toString(),
            style: textStyleTextBold.copyWith(
                color: islike ? Colors.red : whiteColor),
          ),

// Dislike button
          IconButton(
            onPressed: () {
              setState(() {
                int newLikes = widget.comment.likes - 2;
                widget.comment.likes = newLikes;
                islike = false; // Reset like state
                isDlike = !isDlike;
                print('islike :  ${islike}');
                print('isDlike :  ${isDlike}');
              });
            },
            icon: 
            isDlike
                ? SvgPicture.asset('assets/svg/down.svg',
                    width: 20, height: 20, color: Colors.blue[200])
                : SvgPicture.asset('assets/svg/down_empty.svg',
                    width: 20, height: 20, color: whiteColor),
            // Icon(
            //   Icons.arrow_downward,
            //   color: isDlike ? Colors.blueAccent : whiteColor,
            // ),
          ),
        ],
      ),
    );
  }
}
