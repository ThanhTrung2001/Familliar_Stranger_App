import 'package:familiar_stranger/Screen/Welcome/Welcome.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Familiar Stranger',
      theme: ThemeData(
        primaryColor: Main_Text,
        scaffoldBackgroundColor: Background_Color,
        fontFamily: 'Roboto', 
      ),
      home: Welcome_Screen(),
    );
  }
}
