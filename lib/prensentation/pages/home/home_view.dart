import 'package:flutter/material.dart';
import 'package:social_chat_app/prensentation/pages/home/widgets/post_card.dart';

import 'widgets/posts_view.dart';
import 'widgets/profile_story_card.dart';
import 'widgets/story_card.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class HomeView extends StatelessWidget {
  HomeView({super.key});
  var storyData = [
    {
      'imageUrl':
          'https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69460.jpg?w=740&t=st=1686137185~exp=1686137785~hmac=390704896744102739b13593a6ee86ac579820b437588272dda37641c152fe9b',
      'userName': 'user1f',
    },
    {
      'imageUrl':
          'https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user2',
    },
    {
      'imageUrl':
          'https://img.freepik.com/premium-vector/heart-girl-anime-character_603843-485.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user3',
    },
    {
      'imageUrl':
          'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user4',
    },
    {
      'imageUrl':
          'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user5',
    },
  ];

  var postData = [
    {
      'imageUrl':
          'https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69460.jpg?w=740&t=st=1686137185~exp=1686137785~hmac=390704896744102739b13593a6ee86ac579820b437588272dda37641c152fe9b',
      'userName': 'Vikram Singh Rathore',
      "profileImage":
          "https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"
    },
    {
      'imageUrl':
          'https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'Vivek Kumar',
      "profileImage":
          "https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr"
    },
    {
      'imageUrl':
          'https://img.freepik.com/premium-vector/heart-girl-anime-character_603843-485.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'Rohan Singh',
      "profileImage":
          "https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"
    },
    {
      'imageUrl':
          'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'Rohan Singh',
      "profileImage":
          "https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr"
    },
    {
      'imageUrl':
          'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'Rohan Singh',
      "profileImage":
          "https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"
    },
  ];

  var likeImagesList = [
    'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
    'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
    'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 40,
                floating: true,
                pinned: false,
                snap: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Text('Instafeed', style: TextStyle(fontSize: 30)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.radio_button_unchecked,
                            color: Colors.orange),
                      )
                    ]),
                    Icon(Icons.message)
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProfileStoryCard(),
                      ListView.builder(
                          itemCount: storyData.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return StoryCard(
                              profileImage: storyData[index]['imageUrl']!,
                              userName: storyData[index]['userName']!,
                            );
                          })
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: PostsView(postData: postData, likeImagesList: likeImagesList),
              ),
            ],
          ),
        ));
  }
}

