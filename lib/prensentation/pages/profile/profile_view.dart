import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_chat_app/prensentation/pages/profile/widgets/profile_post_card.dart';
import 'package:social_chat_app/prensentation/pages/profile/widgets/profile_reels_cards.dart';
import 'package:social_chat_app/prensentation/pages/profile/widgets/profile_save_cards%20.dart';

import '../auth/login.dart';
import 'widgets/profile_header_card.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            backgroundColor: Color(0xFF1B1B1B),
            title: Text("Profile"),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Badge(
                      textColor: Colors.white,
                      label: Text("5"),
                      child: Icon(Icons.notifications))),
              PopupMenuButton(
                  child: Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => LoginView())));
                        },
                      ))
                    ];
                  })
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [ProfileHeaderCard()];
              },
              body: Column(
                children: [
                  TabBar(tabs: [
                    Tab(
                      icon: Icon(Icons.add_a_photo),
                    ),
                    Tab(
                      icon: Icon(Icons.play_circle_outline),
                    ),
                    Tab(
                      icon: Icon(Icons.bookmark_outline),
                    ),
                  ]),
                  Expanded(
                    child: TabBarView(children: [
                      ProfilePostCards(),
                      ProfileReelsCards(),
                      ProfileSaveCards(),
                    ]),
                  )
                ],
              ))),
    );
  }
}
