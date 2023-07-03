import 'package:flutter/material.dart';
import 'package:social_chat_app/post_upload.dart';
import 'package:social_chat_app/search/search_view.dart';
import 'package:social_chat_app/upload_post/post_view.dart';
import 'home_view.dart';
import 'nav_bar.dart';
import 'profile/profile_view.dart';

class BodyView extends StatefulWidget {
  const BodyView({super.key});

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  int currentIndex = 0;
  var pageViewList = [
    HomeView(),
    SearchView(),
    PostView(),
    PostUploadPage(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedIndex: currentIndex,
      ),
      body: pageViewList[currentIndex],
    );
  }
}
