import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/Screen/ChatRoom/chatRoom.dart';
import 'package:familiar_stranger/Screen/Home/home.dart';
import 'package:familiar_stranger/Screen/Login/login.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/friend_infor.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/friendmodel/friendmodel.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/profile.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/report.dart';
import 'package:familiar_stranger/Screen/Welcome/welcome.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/Component/NavBar/route.dart' as route;

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
      home: Home_Screen(), //Welcome_Screen(),
      onGenerateRoute: route.controller,
      //change to edit screen, when all done, comment this line again
      //initialRoute: route.friend,
    );
  }
}
