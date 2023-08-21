import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../services/firestore_service.dart';
import 'like_images.dart';

class PostFooter extends StatefulWidget {
  const PostFooter({
    super.key,
    required this.likeImagesList,
    required this.postData,
  });
  final dynamic postData;

  final List<String> likeImagesList;

  @override
  State<PostFooter> createState() => _PostFooterState();
}

class _PostFooterState extends State<PostFooter> {
  var isLike = false;
  var likeCount = 0;

  var firestoreService = FirestoreService();

  void initState() {
    super.initState();
    likeCount = widget.postData['likesCount'];
  }

  like() {
    setState(() {
      isLike = !isLike;
      if (isLike) {
        likeCount++;
      } else {
        likeCount--;
      }
      firestoreService.isLike(isLike, widget.postData['id'],
          FirebaseAuth.instance.currentUser!.uid);
    });
  }

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
                  likeImages: widget.likeImagesList,
                ),
                SizedBox(
                  width: 15,
                ),
                Text("$likeCount Likes",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      like();
                    },
                    icon: isLike
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : Icon(Icons.favorite_border_outlined)),
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
