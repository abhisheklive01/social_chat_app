import 'package:flutter/material.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color(0xFF1B1B1B),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Color(0xCAF15800),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                                "https://img.freepik.com/free-vector/hand-drawn-korean-drawing-style-character-illustration_23-2149623257.jpg?size=338&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr"),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 5,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: Icon(Icons.add_circle_outline)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ProfileCountTitle(
                    title: 'Post',
                    count: '25',
                  ),
                  CustomDivider(),
                  ProfileCountTitle(
                    title: 'Followers',
                    count: '250K',
                  ),
                  CustomDivider(),
                  ProfileCountTitle(
                    title: 'Following',
                    count: '250',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Anna Yvette",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              Text("Grapic Designer | Photographer"),
              SizedBox(
                height: 5,
              ),
              Text(
                "Capturing moments, one frame at a time. 📸 Passionate photographer seeking beauty in every click.",
                style: TextStyle(color: Colors.grey.shade400),
              ),
              SizedBox(
                height: 30,
                child: TextButton(
                    onPressed: () {},
                    child: Text("https://fonts.google.com/icon")),
              )
            ],
          )),
    );
  }
}

class ProfileCountTitle extends StatelessWidget {
  const ProfileCountTitle({
    super.key,
    required this.count,
    required this.title,
  });

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        )
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(
        color: Colors.grey.shade600,
        width: 2.0,
      ))),
    );
  }
}
