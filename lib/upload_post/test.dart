
  import 'package:flutter/material.dart';

void showMediaBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Pick Image'),
              // onTap: pickImage,
            ),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Pick Video'),
              // onTap: pickVideo,
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take Picture'),
              // onTap: takePicture,
            ),
          ],
        );
      },
    );
  }