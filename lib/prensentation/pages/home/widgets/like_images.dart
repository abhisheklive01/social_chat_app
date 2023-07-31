import 'package:flutter/material.dart';

class LikesImages extends StatelessWidget {
  const LikesImages({
    super.key,
    required this.likeImages,
  });
  final List<String> likeImages;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int index = 0; index < likeImages.length; index++)
          Container(
            width: 35,
            height: 35,
            margin: EdgeInsets.only(left: 26.0 * index),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.white)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(likeImages[index]),
            ),
          ),
      ],
    );
  }
}
