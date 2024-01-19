import 'dart:io';

import 'package:flutter/material.dart';
import 'package:redit/consts/colors.dart';
import 'package:redit/consts/helper_padding.dart';
import 'package:redit/consts/helper_text_style.dart';
import 'package:redit/data.dart';
import 'package:redit/model.dart';
import 'package:redit/screens/widgets/avatar.dart';
import 'package:redit/screens/widgets/comment_screen.dart';
import 'package:redit/screens/widgets/info_widget.dart';
import 'package:redit/screens/widgets/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

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

class VideoPost extends StatefulWidget {
  const VideoPost({super.key, required this.post, required this.user});
  final Post post;
  final User user;

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  @override
  bool bottomSheetEnable = false;
  double _currentVolume = 0.0;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.post.videoUrl))
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });

    FlutterVolumeController.addListener((volume) {
      setState(() {
        _currentVolume = volume;
      });
    });
  }

  @override
  void dispose() {
    FlutterVolumeController.removeListener();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    AudioStream _audioStream = AudioStream.music;
    bool isMuted = false;
 
    return Stack(
      children: [
        //video
        Positioned(
          child: Column(
            mainAxisAlignment: bottomSheetEnable
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Container(
                width: double.maxFinite,
                color: const Color.fromARGB(255, 53, 41, 41),
                height: 220,
                child: Stack(
                  children: [
                    _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : Container(),
                    Positioned(
                      width: screenWidth,
                      bottom: 20,
                      child: bottomSheetEnable ?
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black12,
                            radius: 25,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              },
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: whiteColor,
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isMuted = !isMuted;
                                  isMuted;
                                  FlutterVolumeController.setMute(
                                    isMuted,
                                  );
                                });
                              },
                              icon: Icon(
                                isMuted
                                    ? Icons.volume_down
                                    : Icons.volume_off_sharp,
                                color: whiteColor,
                              )),
                        ],
                      )  : SizedBox.shrink(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          width: screenWidth,
          height: screenheight / 4,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AvatarWidgets(
                    user: widget.user,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                        child: Container(
                      width: 200,
                      child: Text(
                        '${widget.post.description}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                  mediumPaddingVert,
                ],
              ),
              InfoIconsWidgets(
                post: widget.post,
              ),
            ],
          ),
        ),
        //avatar + name row
        //   Text('Username: ${post.username}'),
        //text desc post
        //colum like dislike comment  icons
        // Text('Likes: ${post.likes} | Dislikes: ${post.dislikes}'),
        Positioned(
          bottom: 5,
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: whiteColor,
                ),
              ),
              Container(
              width: MediaQuery.of(context).size.width / 1.4,
              child: ProgressBar(
                baseBarColor: Colors.transparent,
                progressBarColor: whiteColor,
                barHeight: 3,
                progress: _controller.value.position,
                buffered: _controller.value.buffered.isEmpty
                    ? Duration.zero
                    : _controller.value.buffered.last.end,
                total: _controller.value.duration,
                thumbColor: whiteColor,
                timeLabelTextStyle: TextStyle(color: Colors.white),
                timeLabelLocation: TimeLabelLocation.none,
                onSeek: (duration) {
                  _controller.seekTo(duration);
                },
              ),
            ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.volume_down, color: whiteColor),
              ),
            ],
          ),
        ),
        Positioned(
          width: screenWidth,
          bottom: 0,
          child: GestureDetector(
              onTap: () async {
                setState(() {
                  bottomSheetEnable = !bottomSheetEnable;
                  bottomSheetEnable;
                  print(bottomSheetEnable);
                });
                if (bottomSheetEnable) {
                   await showModalBottomSheet(
                    backgroundColor: greyColor[900],
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: bottomCommentSheet(widget.post),
                            ),
                           const  TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter your text',
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.image),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );

               
                  setState(() {
                    bottomSheetEnable = !bottomSheetEnable;
                  });
                }
              },
              child: Center(
                  child: Container(
                color: whiteColor,
                width: 50,
                height: 10,
              ))),
        ),
        // bottomCommentSheet()
      ],
    );
  }
}

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
