import 'package:flutter/material.dart';

class PostImages extends StatelessWidget {
  PostImages({super.key, required this.imageUrls});

  final List imageUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: PageView.builder(
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrls[index],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}
