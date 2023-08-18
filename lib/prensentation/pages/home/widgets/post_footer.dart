import 'package:flutter/material.dart';

import 'like_images.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({
    super.key,
    required this.likeImagesList,
  });

  final List<String> likeImagesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                LikesImages(
                  likeImages: likeImagesList,
                ),
                SizedBox(
                  width: 15,
                ),
                Text("15 Likes",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.favorite_border_outlined),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.message_outlined),
              ],
            ),
            Icon(Icons.bookmark_border_outlined),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "View All 48 comments",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
