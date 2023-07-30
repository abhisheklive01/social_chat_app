import 'package:flutter/material.dart';

import '../../../services/firestore_service.dart';
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    getPost();
    super.initState();
  }

  List<Map<String, dynamic>> postData = [];

  var firestoreService = FirestoreService();

  getPost() async {
    var posts = await firestoreService.getPost();
    setState(() {
      postData = posts;
    });
    print(posts);
  }

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

  // var postData = [
  //   {
  //     'imageUrl':
  //         'https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69460.jpg?w=740&t=st=1686137185~exp=1686137785~hmac=390704896744102739b13593a6ee86ac579820b437588272dda37641c152fe9b',
  //     'userName': 'Vikram Singh Rathore',
  //     "profileImage":
  //         "https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"
  //   },
  //   {
  //     'imageUrl':
  //         'https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
  //     'userName': 'Vivek Kumar',
  //     "profileImage":
  //         "https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr"
  //   },
  //   {
  //     'imageUrl':
  //         'https://img.freepik.com/premium-vector/heart-girl-anime-character_603843-485.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
  //     'userName': 'Rohan Singh',
  //     "profileImage":
  //         "https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"
  //   },
  //   {
  //     'imageUrl':
  //         'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
  //     'userName': 'Rohan Singh',
  //     "profileImage":
  //         "https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr"
  //   },
  //   {
  //     'imageUrl':
  //         'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
  //     'userName': 'Rohan Singh',
  //     "profileImage":
  //         "https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"
  //   },
  // ];

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
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: postData.length,
                    itemBuilder: (context, index) {
                      return PostCard(
                        likeImagesList: [],
                        postData: postData[index],
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.likeImagesList,
    required this.postData,
  });

  final List<String> likeImagesList;
  final dynamic postData;

  @override
  Widget build(BuildContext context) {
    var images = postData['postImages'] as List;
    var listImages = postData['likesImage'] as List;
    print(listImages);

    // var images = postData['postImages'] as List;
    // var listImages = postData['likesImage'] as List<String>;
    // for()
    // {

    // }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              // CircleAvatar(
              //   radius: 35,
              //   backgroundImage: NetworkImage(postData['profileImage']),
              // ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${postData['userName']}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text('15 mins ago', style: TextStyle(color: Colors.white38))
                ],
              )
            ]),
            Icon(Icons.more_vert)
          ]),
          SizedBox(
            height: 15,
          ),
          images.isEmpty
              ? SizedBox()
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "${postData['postImages'][0]}",
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
          Text("${postData['description']}"),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (listImages.isNotEmpty)
                    LikesImages(
                      likeImages: listImages,
                    ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("${postData['likesCount']} Likes",
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
            "View All ${postData['commentsCount']} comments",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class LikesImages extends StatelessWidget {
  const LikesImages({
    super.key,
    required this.likeImages,
  });
  final likeImages;

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

class StoryCard extends StatelessWidget {
  StoryCard({
    super.key,
    required this.profileImage,
    required this.userName,
  });

  final String profileImage;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 4, color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(profileImage),
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(userName)
        ],
      ),
    );
  }
}

class ProfileStoryCard extends StatelessWidget {
  const ProfileStoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 4, color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-vector/hand-drawn-korean-drawing-style-character-illustration_23-2149623257.jpg?size=338&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3.0, color: Colors.white)),
            child: Icon(
              Icons.add_circle,
              size: 30,
              color: Colors.orange,
            ),
          ),
        )
      ],
    );
  }
}
