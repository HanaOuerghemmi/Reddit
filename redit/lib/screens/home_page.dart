import 'package:flutter/material.dart';
import 'package:redit/screens/post_screen.dart';
import 'package:redit/screens/widgets/comment_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [

          //page 1
PostScreen(),

          //page2
        ],
      ),
    );
  }
}