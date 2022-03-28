import 'package:familiar_stranger/Screen/Home/Home.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/Profile.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/Setting.dart';
import 'package:flutter/material.dart';

//Route's Name
const String profile = 'profile';
const String home = 'home';
const String setting = 'setting';
const String friend = 'friend';
const String logout = 'logout';

//COntrol route flow
Route<dynamic> controller(RouteSettings settings){
  switch(settings.name){
    case home:
      return MaterialPageRoute(builder: (context) => Home_Screen());
    case profile:
      return MaterialPageRoute(builder: (context) => Profile_Screen());
    case setting:
      return MaterialPageRoute(builder: (context) => Setting_Screen());
    default :
      throw('Does not exist!');
  }
}