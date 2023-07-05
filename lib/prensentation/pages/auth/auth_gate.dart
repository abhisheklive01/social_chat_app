import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_chat_app/prensentation/pages/auth/sign_up.dart';

import '../../widgets/body_view.dart';
import 'onboarding.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      checkAuthState();
    });
    super.initState();
  }

  Future<void> checkAuthState() async {
    User? user = _auth.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: ((context) => BodyView())));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((context) => SignUp())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
