import 'package:familiar_stranger/Screen/Home/home.dart';
import 'package:familiar_stranger/Screen/Login/login.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/profile.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/setting.dart';
import 'package:flutter/material.dart';

//Route's Name
const String profile = 'profile';
const String home = 'home';
const String setting = 'setting';
const String friend = 'friend';
const String logout = 'logout';
const String login = 'login';

//COntrol route flow
Route<dynamic> controller(RouteSettings settings){
  switch(settings.name){
    case home:
      return MaterialPageRoute(builder: (context) => Home_Screen());
    case profile:
      return MaterialPageRoute(builder: (context) => Profile_Screen());
    case setting:
      return MaterialPageRoute(builder: (context) => Setting_Screen());
    case login:
      return MaterialPageRoute(builder: (context) => Login_Screen());
    default :
      throw('Does not exist!');
  }
}