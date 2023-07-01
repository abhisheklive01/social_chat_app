import 'package:flutter/material.dart';
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
    Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      child: Text('Page 2'),
    ),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text('Page 3'),
    ),
    Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: Text('Page 4'),
    ),
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
