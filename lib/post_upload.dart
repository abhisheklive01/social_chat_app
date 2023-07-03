import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

class PostUploadPage extends StatefulWidget {
  @override
  _PostUploadPageState createState() => _PostUploadPageState();
}

class _PostUploadPageState extends State<PostUploadPage> {
  List<Map<String, dynamic>> _mediaFiles = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> pickVideo() async {
    final pickedFile = await _picker.pickVideo(
      source: ImageSource.gallery,
      maxDuration: Duration(seconds: 60), // Maximum video duration in seconds
    );

    if (pickedFile != null) {
      final videoFile = File(pickedFile.path);
      final thumbnailFile = await _getThumbnail(videoFile);
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      final mediaJson = {
        'id': id,
        'mediaFile': videoFile.path,
        'thumbnailFile': thumbnailFile.path,
        'mediaType': 'video',
      };

      setState(() {
        _mediaFiles.add(mediaJson);
      });
    }

    Navigator.pop(context); // Close the bottom sheet after selecting media
  }

  Future<void> pickImage() async {
    final pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles != null) {
      final mediaJsonList = pickedFiles.map((pickedFile) {
        final id = DateTime.now().millisecondsSinceEpoch.toString();
        return {
          'id': id,
          'mediaFile': File(pickedFile.path).path,
          'thumbnailFile': File(pickedFile.path).path,
          'mediaType': 'image',
        };
      }).toList();

      setState(() {
        _mediaFiles.addAll(mediaJsonList);
      });
    }

    Navigator.pop(context); // Close the bottom sheet after selecting media
  }

  Future<void> takePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      final thumbnailPath = imageFile.path;

      final id = DateTime.now().millisecondsSinceEpoch.toString();
      final mediaJson = {
        'id': id,
        'mediaFile': imageFile.path,
        'thumbnailFile': thumbnailPath,
        'mediaType': 'image',
      };

      setState(() {
        _mediaFiles.add(mediaJson);
      });
    }

    Navigator.pop(context); // Close the bottom sheet after taking a picture
  }

  Future<File> _getThumbnail(File mediaFile) async {
    final thumbnailPath = await VideoCompress.getFileThumbnail(
      mediaFile.path,
      quality: 50,
      position: -1,
    );
    return thumbnailPath;
  }

  void showMediaBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Pick Image'),
              onTap: pickImage,
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

  void removeMedia(int index) {
    setState(() {
      _mediaFiles.removeAt(index - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Upload Post'),
      ),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 69, 56)),
          onPressed: () {},
          child: Text("Post")),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Write Something"),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: null, // Allows unlimited lines
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    filled: true,
                    fillColor: Color.fromARGB(255, 39, 39, 39),
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _mediaFiles.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          onPressed: () => showMediaBottomSheet(),
                        ),
                      );
                    }
                    final mediaFile = _mediaFiles[index - 1];
                    final isVideo = mediaFile['mediaType'] == 'video';
                    final thumbnailFile = File(mediaFile['thumbnailFile']);
                    return InkWell(
                      onLongPress: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.delete),
                                  title: Text('Delete'),
                                  onTap: () {
                                    removeMedia(index);
                                    Navigator.pop(context);
                                  },
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
                      },
                      child: Stack(
                        children: [
                          Image.file(
                            thumbnailFile,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          if (isVideo)
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.play_circle_filled,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
