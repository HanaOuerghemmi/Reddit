import 'package:flutter/material.dart';
import 'package:redit/model.dart';

class AvatarWidgets extends StatelessWidget {
  final User user;
  const AvatarWidgets({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
            radius: 20,
            child:ClipOval(
    child: Image.network(
      user.imageUserUrl,
     
      fit: BoxFit.cover,
    ),
  ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(user.username, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
