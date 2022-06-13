import 'package:familiar_stranger/Screen/Profile&Setting/component/friend_infor_Body.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:flutter/material.dart';

class Friend_Infor_Screen extends StatelessWidget {
  Friend targetUser;
  Friend_Infor_Screen({ Key? key, required this.targetUser, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
        backgroundColor: Color.fromARGB(255, 83, 59, 91),
        title: Text("Familiar Stranger", style: TextStyle(fontSize: 20.0, fontFamily: 'ZenDots', color: Main_Text),),
        centerTitle: true,
        // actions: <Widget>[
        //   Padding(
        //     padding: EdgeInsets.only(right: 20.0),
        //     child: GestureDetector(
        //       onTap: () {},
        //       child: Icon(Icons.logout_rounded, color: Colors.white,),
              
        //     ),
        //   )
        // ],
        ),  
      ),
      body: Friend_Info_Body(targetUser: targetUser,),
      
    );
  }
}