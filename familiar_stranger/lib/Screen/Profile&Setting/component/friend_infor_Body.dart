import 'package:familiar_stranger/Component/Button/Icon_ButtonRounded.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_BigIcon_NoButton.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_LogOut.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/component/profile_BG.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/report.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:flutter/material.dart';

class Friend_Info_Body extends StatefulWidget {
  //Define Friend -> targetUser;
  Friend targetUser;
  Friend_Info_Body({
     Key? key,
     required this.targetUser
      }) : super(key: key);

  @override
  State<Friend_Info_Body> createState() => _Friend_Info_BodyState();
}

class _Friend_Info_BodyState extends State<Friend_Info_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Profile_PG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("UID : $UIDFriend" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Main_Text),),
                  SizedBox(width: size.width* 0.01,),
                  IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.copy, color: Main_Text,), iconSize: 20,),
                    ],
                  ),
                  CircleAvatar(               
                    backgroundColor: Border_Color,
                    radius: 100.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://i.imgur.com/DSG7rkv.jpg'),
                      radius: 95.0,
                      ),
                    ),
                  SizedBox(height: size.height*0.025,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(FriendName, style: TextStyle(color: Main_Text, fontSize: 20, fontWeight: FontWeight.w600)),
                      SizedBox(width: size.width * 0.01,),
                      Icon( (Friend_sex_male == true) ? Icons.male : Icons.female, color: (Friend_sex_male == true) ? male_icon_color : female_icon_color, size: 30,),
                    ],
                  ),
                  SizedBox(height: size.height*0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age : $FriendAge", style: TextStyle(fontSize: 16, color: Main_Text,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon_Button_Rounded(bordercolor: Main_Text, iconcolor: Main_Text, press: (){
                          showDialog(
                                    barrierDismissible:
                                        false, // this one prevent closing Dialog when click outside
                                    context: context,
                                    builder: (context) {
                                      Future.delayed(Duration(seconds: 20), () {
                                      // Navigator.of(context).pop();
                                      // Navigator.push(context, MaterialPageRoute(builder: (context){return const Home_Screen();}));
                                    });
                                      //Time delay for Loading Dialog to get the result from login
                                      return Dialog_BigIcon_NoButton(
                                        dialog_content: "Request!\nWait reponse for 20 seconds...",
                                        dialog_image_link: 'assets/Icons/Check_Circle.png',
                                      );
                                    });
                        }, icons: Icons.room_rounded, icon_size: 30, widthSize: size.width*0.55,backgroundColor: Transp_Color,),
                        SizedBox(height: 10,),
                        Icon_Button_Rounded(bordercolor: Border_Color, iconcolor: Border_Color, press: (){
                          showDialog(context: context, builder: (context){ return Dialog_LogOut(title: "Delete him/her?" ,press_yes: (){
                            setState(() { //where to delete it from sever and back to friend list
                              //  recentChats.remove(select);
                              Navigator.pop(context);
                            });
                            });});
                        }, icons: Icons.delete_rounded, icon_size: 30, widthSize: size.width*0.55,backgroundColor: Transp_Color,),
                        SizedBox(height: 10,),
                        Icon_Button_Rounded(bordercolor: Colors.red, iconcolor: Colors.red, press: (){ //Must define the Friend target User First, then go to report screen wwith targetUser;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Report_Screen(targetUser: targetUser,)), 
                        );
                        }, icons: Icons.report_rounded, icon_size: 30, widthSize: size.width*0.55,backgroundColor: Transp_Color,),
                      ],
                    ),
                  ),
                  
                  
          
        ],
      ),
    );
  }
}