import 'package:flutter/material.dart';
import 'package:redit/consts/helper_padding.dart';
import 'package:redit/consts/helper_text_style.dart';

  void showDeleteConfirmation(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black54,
          title: Text('Are you sure?'  ,style: textStyleTextBold,),
          content: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'You cannot restore commenets that have been deleted.',
                  style: textStyleText,
                ),
                mediumPaddingVert,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the popup
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.black26),
                      child: Text('CANCEL', style: textStyleTextBold,),
                    ),
                    ElevatedButton(
                      onPressed: () {
                      
                        Navigator.of(context).pop(); // Close the popup
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: Text('DELETE',style: textStyleTextBold),
                    )
                    ,
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }