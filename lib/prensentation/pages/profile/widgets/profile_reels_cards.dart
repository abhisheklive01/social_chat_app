import 'package:flutter/material.dart';

class ProfileReelsCards extends StatelessWidget {
  ProfileReelsCards({super.key});
  List<Map<String, dynamic>> mediaItems = [
    {
      "id": "1",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg",
      "isVideo": false
    },
    {
      "id": "2",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2017/09/26/17/34/ballet-2789416_640.jpg",
      "isVideo": true
    },
    {
      "id": "3",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2019/05/28/05/06/female-4234344_640.jpg",
      "isVideo": false
    },
    {
      "id": "4",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/10/20/08/36/woman-1754895_640.jpg",
      "isVideo": true
    },
    {
      "id": "5",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2019/07/25/10/43/ballerina-4362282_640.jpg",
      "isVideo": false
    },
    {
      "id": "6",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg",
      "isVideo": false
    },
    {
      "id": "7",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/07/08/23/17/girl-1505407_640.jpg",
      "isVideo": true
    },
    {
      "id": "8",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2023/01/01/16/35/street-7690347_640.jpg",
      "isVideo": false
    },
    {
      "id": "9",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2020/06/29/10/08/ballet-5352231_640.jpg",
      "isVideo": false
    },
    {
      "id": "1",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg",
      "isVideo": false
    },
    {
      "id": "2",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2017/09/26/17/34/ballet-2789416_640.jpg",
      "isVideo": true
    },
    {
      "id": "3",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2019/05/28/05/06/female-4234344_640.jpg",
      "isVideo": false
    },
    {
      "id": "4",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/10/20/08/36/woman-1754895_640.jpg",
      "isVideo": true
    },
    {
      "id": "5",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2019/07/25/10/43/ballerina-4362282_640.jpg",
      "isVideo": false
    },
    {
      "id": "6",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg",
      "isVideo": false
    },
    {
      "id": "7",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/07/08/23/17/girl-1505407_640.jpg",
      "isVideo": true
    },
    {
      "id": "8",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2023/01/01/16/35/street-7690347_640.jpg",
      "isVideo": false
    },
    {
      "id": "9",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2020/06/29/10/08/ballet-5352231_640.jpg",
      "isVideo": false
    },
    {
      "id": "1",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg",
      "isVideo": false
    },
    {
      "id": "2",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2017/09/26/17/34/ballet-2789416_640.jpg",
      "isVideo": true
    },
    {
      "id": "3",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2019/05/28/05/06/female-4234344_640.jpg",
      "isVideo": false
    },
    {
      "id": "4",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/10/20/08/36/woman-1754895_640.jpg",
      "isVideo": true
    },
    {
      "id": "5",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2019/07/25/10/43/ballerina-4362282_640.jpg",
      "isVideo": false
    },
    {
      "id": "6",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg",
      "isVideo": false
    },
    {
      "id": "7",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2016/07/08/23/17/girl-1505407_640.jpg",
      "isVideo": true
    },
    {
      "id": "8",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2023/01/01/16/35/street-7690347_640.jpg",
      "isVideo": false
    },
    {
      "id": "9",
      "imageUrl":
          "https://cdn.pixabay.com/photo/2020/06/29/10/08/ballet-5352231_640.jpg",
      "isVideo": false
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: mediaItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            childAspectRatio: 0.6),
        itemBuilder: (context, index) {
          var item = mediaItems[index];
          return Stack(
            children: [
              Image.network(
                "${item['imageUrl']}",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                  bottom: 8,
                  left: 8,
                  child: Row(
                    children: [
                      Icon(Icons.play_circle_fill_outlined),
                      Text("295")
                    ],
                  ))
            ],
          );
        });
  }
}
