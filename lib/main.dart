import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_chat_app/prensentation/pages/auth/login.dart';
import 'prensentation/pages/auth/auth_gate.dart';
import 'firebase_options.dart';

// ignore_for_file: prefer_const_constructors

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
            navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.black,
          indicatorColor: Color(0xCAF15800),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          labelTextStyle: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.selected)
                  ? TextStyle(
                      color: Color(0xCAF15800),
                    )
                  : TextStyle()),
        )),
        debugShowCheckedModeBanner: false,
        home: AuthGate());
  }
}
