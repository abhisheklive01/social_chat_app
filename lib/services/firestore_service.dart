import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference post = FirebaseFirestore.instance.collection('posts');
  CollectionReference likes = FirebaseFirestore.instance.collection('likes');

  Future<List<Map<String, dynamic>>> getPost() async {
    // data types
    List<Map<String, dynamic>> postData = [];
    try {
      await post.get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          postData.add(doc.data() as Map<String, dynamic>);
        });
      });
      return postData;
    } catch (e) {
      return [];
    }
  }

  isLike(value, postId, userId) async {
    if (value) {
      var data = {
        "likeAt": DateTime.timestamp(),
        "postId": postId,
        "userId": userId,
      };
      await post.doc(postId).collection("likes").doc(userId).set(data);
      await post.doc(postId).update({"likesCount": FieldValue.increment(1)});
    } else {
      await post.doc(postId).collection("likes").doc(userId).delete();
      await post.doc(postId).update({"likesCount": FieldValue.increment(-1)});
    }
  }

  Future<void> addUser(data) async {
    try {
      await users.doc(data['id']).set(data);
    } catch (error) {
      print("Failed to add user: $error");
      throw error;
    }
  }

  Future<void> addPost(data) async {
    try {
      await post.doc(data['id']).set(data);
    } catch (error) {
      print("Failed to add user: $error");
      throw error;
    }
  }

  Future<String> uploadFile(File selectedFile) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('files')
        .child(selectedFile.path.split('/').last);

    try {
      var uploadTask = await ref.putFile(selectedFile);
      var downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  Future<void> updateUser(data, context) async {
    try {
      await users.doc(data['id']).update(data);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Accout Updated")));
    } catch (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("updation Failed"),
              content: Text(error.toString()),
            );
          });
      throw error;
    }
  }
}
