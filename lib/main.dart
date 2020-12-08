import 'package:flutter/material.dart';
import "package:comment/homePage.dart";
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comment handler',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Display(),
    );
  }
}