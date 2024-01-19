
  import 'package:flutter/material.dart';
  class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
  void showCommentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Top part - ListView
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                        // Handle item tap
                      },
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () {
                        // Handle item tap
                      },
                    ),
                    // Add more list items as needed
                  ],
                ),
              ),
              // Bottom part - TextField
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your text here',
                ),
                // Add any other TextField properties or controllers as needed
              ),
              SizedBox(height: 16.0), // Optional spacing
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }
