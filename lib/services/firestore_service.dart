import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  
  Future<void> addUser(data) async {
    try {
      await users.doc(data['id']).set(data);
    } catch (error) {
      print("Failed to add user: $error");
    }
  }
}