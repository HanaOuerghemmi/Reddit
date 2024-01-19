import 'package:redit/model.dart';
import 'package:get/get.dart';



 List<User> users = [
    User(
      id: 'user1',
      username: 'JohnDoe',
      imageUserUrl: 'https://img.freepik.com/psd-gratuit/illustration-3d-avatar-profil-humain_23-2150671142.jpg?w=740&t=st=1705421403~exp=1705422003~hmac=9d5e1a6b92f845d912748f5bacb6b93ee0183392911e95cf6840049a5414a62b',
    ),
    User(
      id: 'user2',
      username: 'JaneSmith',
      imageUserUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_bQcf7BK8r-GWy_MxbKmVG7UQCMjPqGSGJ6FiqVDVSg&s',
    ),
    User(
      id: 'user3',
      username: 'BobJohnson',
      imageUserUrl: 'https://img.lovepik.com/free-png/20210918/lovepik-avatar-girl-png-image_400233600_wh1200.png',

    ),
  ];

List<Post> posts = [
  Post(
    id: '111',
    user: users[0],
    description: 'hdhoedfhfeiooohf uibfeif ihbweihfe ihbfi jjeduue ',
   
    videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    likes: 20,
 
    comments: [
      Comment(id: '22', user: users[1], text: 'comm1 lorem  loremlorem lorem comm1 lorem  loremlorem lorem comm1 lorem  loremlorem lorem comm1 lorem  loremlorem lorem comm1 lorem  loremlorem lorem comm1 lorem  loremlorem lorem comm1 lorem  loremlorem lorem', likes: 10, ),
      Comment(id: '23', user: users[1], text: 'comm2', likes: 100, ),
      Comment(id: '24', user: users[0], text: 'comm3', likes: 5, ),
      Comment(id: '25', user: users[1], text: 'comm4', likes: 0, ),
      Comment(id: '26', user: users[0], text: 'comm1', likes: 10, ),
      Comment(id: '27', user: users[1], text: 'comm2', likes: 100, ),
      Comment(id: '28', user: users[2], text: 'comm3', likes: 5, ),
      Comment(id: '29', user: users[0], text: 'comm4', likes: 0, ),
    ],
  ),
  
  // Add more posts as needed
];
