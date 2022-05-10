// import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:flutter/material.dart';
import 'package:familiar_stranger/models/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as socketio;

//Socket
late socketio.Socket socket;

//Background
const Background_Color = Colors.black;
const Transp_Color = Colors.transparent;
//Border
const Border_Color = Color.fromARGB(255, 157, 104, 197);
const Border_Checkbox =Color.fromARGB(255, 157, 104, 197);
//Text
const Main_Text = Colors.white;
const Sub_Text = Color.fromARGB(255, 157, 104, 197);
//Dialog
const Dialog_Background = Color.fromARGB(255, 220, 146, 231);
//FriendContact
const Invite_Color = Colors.white;
const Delete_Friend = Color.fromARGB(255, 157, 104, 197);
const Report_Friend = Colors.red;
//Icon
const people_icon = Icons.people;
const lock_icon = Icons.lock;
//Timer


//Models
User user = const User(id: '', phoneNumber: '',token: '');

//SignUp, SignIn, Forget and Verify
String PhoneNumber = "";
String Password = "";
String RetypePassword = "";
String VerifyCode = "";

//Variable for account
String user_phonenumber = "";
String password = "";
String old_password = "";
String change_password = "";
String retype_password = "";
String account_name = "Kodoku";
bool sex_male = true;
String age = '20';
String UID = "00000000";
// String wallpaper_link = "";
String avatar_link = "";
//select

//Friend
String UIDFriend = "00000001";
String FriendName = "Fukuro";
bool Friend_sex_male = false;
int FriendAge = 20; 
const female_icon_color = Colors.red;
const male_icon_color = Colors.green;
 // Get from Dialog_Input_One
//select

//report checkbox
bool cb1 = false;
bool cb2 = false;
bool cb3 = false;
bool cb4 = false;
String report_other = "";


///Test Localhost
String addressIP = '192.168.3.97:3000';

//message
String testsend = "";