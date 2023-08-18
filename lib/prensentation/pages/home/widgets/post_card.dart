import 'package:flutter/material.dart';
import 'package:social_chat_app/prensentation/pages/home/widgets/post_footer.dart';
import 'package:social_chat_app/prensentation/pages/home/widgets/post_header.dart';
import 'post_images.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.likeImagesList,
    required this.postData,
  });

  final List<String> likeImagesList;
  final Map<String, dynamic> postData;

  @override
  Widget build(BuildContext context) {
    var postImages = postData['postImages'] as List ?? [];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(postData: postData),
          SizedBox(
            height: 15,
          ),
          if (postImages.isNotEmpty)
            PostImages(
              imageUrls: postImages,
            ),
          SizedBox(
            height: 15,
          ),
          PostFooter(likeImagesList: likeImagesList),
        ],
      ),
    );
  }
}
