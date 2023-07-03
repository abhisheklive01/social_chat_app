import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

class MediaPicker {
  final ImagePicker picker = ImagePicker();

  Future<List<Map<String, dynamic>>> pickImage() async {
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null) {
      final mediaJsonList = <Map<String, dynamic>>[];
      for (var pickedFile in pickedFiles) {
        final id = DateTime.now().microsecondsSinceEpoch.toString();

        final mediaJson = {
          'id': id,
          'mediaFile': File(pickedFile.path).path,
          'thumbnailFile': File(pickedFile.path).path,
          'mediaType': "image"
        };
        mediaJsonList.add(mediaJson);
      }
      return mediaJsonList;
    } else {
      return [];
    }
  }

  takePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final id = DateTime.now().microsecondsSinceEpoch.toString();
      final mediaJson = {
        'id': id,
        'mediaFile': File(pickedFile.path).path,
        'thumbnailFile': File(pickedFile.path).path,
        'mediaType': "image"
      };
      return mediaJson;
    } else {
      return null;
    }
  }

  videoPick() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      final thumbnailFile = await _getThumbnail(File(pickedFile.path));
      final id = DateTime.now().microsecondsSinceEpoch.toString();
      final mediaJson = {
        'id': id,
        'mediaFile': File(pickedFile.path).path,
        'thumbnailFile': thumbnailFile.path,
        'mediaType': "video"
      };
      return mediaJson;
    } else {
      return null;
    }
  }

  Future<File> _getThumbnail(File mediaFile) async {
    final thumbnailFile = await VideoCompress.getFileThumbnail(mediaFile.path,
        quality: 50, // default(100)
        position: -1 // default(-1)
        );
    return thumbnailFile;
  }
}
