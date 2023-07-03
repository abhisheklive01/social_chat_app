import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class MediaBottomSheet {
  static void show(context, Function() pickImages, Function() takePicture,
      Function() pickVideo) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Pick Image'),
              onTap: pickImages,
            ),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Pick Video'),
              onTap: pickVideo,
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take Picture'),
              onTap: takePicture,
            ),
          ],
        );
      },
    );
  }
}

class RemoveMediaBottomSheet {
  static void show(
    context,
    Function() removeMedia,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Remove'),
              onTap: removeMedia,
            ),
            ListTile(
              leading: Icon(Icons.cancel),
              title: Text('Cancel'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
