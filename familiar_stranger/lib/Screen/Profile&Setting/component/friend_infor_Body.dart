import 'package:familiar_stranger/Component/Button/Icon_ButtonRounded.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/component/profile_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Friend_Info_Body extends StatefulWidget {
  const Friend_Info_Body({ Key? key }) : super(key: key);

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
                        Icon_Button_Rounded(bordercolor: Main_Text, iconcolor: Main_Text, press: (){}, icons: Icons.room_rounded, icon_size: 30),
                        SizedBox(height: 10,),
                        Icon_Button_Rounded(bordercolor: Border_Color, iconcolor: Border_Color, press: (){}, icons: Icons.delete_rounded, icon_size: 30),
                        SizedBox(height: 10,),
                        Icon_Button_Rounded(bordercolor: Colors.red, iconcolor: Colors.red, press: (){}, icons: Icons.report_rounded, icon_size: 30),
                      ],
                    ),
                  ),
                  
                  
          
        ],
      ),
    );
  }
}