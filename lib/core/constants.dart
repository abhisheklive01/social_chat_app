import 'dart:math';

String getTimeAgo(int timestamp) {
  print(timestamp);
  DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(timestamp);
  DateTime now = DateTime.now();

  int differenceInSeconds = max(0, now.difference(dateTime).inSeconds);
  if (differenceInSeconds < 60) {
    return "$differenceInSeconds seconds ago";
  } else {
    int differenceInMinuts = differenceInSeconds ~/ 60;

    if (differenceInMinuts < 60) {
      return "$differenceInMinuts minuts ago";
    } else {
      int differenceInHours = differenceInMinuts ~/ 60;

      if (differenceInHours < 60) {
        return "$differenceInHours hours ago";
      } else {
        int differenceInDays = differenceInHours ~/ 60;
        return "$differenceInDays days ago";
      }
    }
  }
}
