import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../prensentation/widgets/body_view.dart';
import 'firestore_service.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  final firestoreService = FirestoreService();
  Future<void> createUser(data, context) async {
    var createAt = DateTime.now().millisecond;
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      data['id'] = credential.user!.uid;
      data['createAt'] = createAt;
      await firestoreService.addUser(data);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => BodyView())));
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Sign Up Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  Future<void> loginUser(data, context) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => BodyView())));
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }
}
