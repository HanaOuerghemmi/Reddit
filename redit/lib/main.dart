import 'package:flutter/material.dart';
import 'package:redit/screens/controller.dart';
import 'package:redit/screens/post_screen.dart';

import 'package:get/get.dart';

void main() => runApp(VideoPlayerApp());

class VideoPlayerApp extends StatelessWidget {
  VideoPlayerApp({super.key});
  final DataController dataController = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Video Player Demo',
        home:
            PostScreen()
        );
  }
}
