import 'package:familiar_stranger/Screen/Profile&Setting/component/report_body.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:flutter/material.dart';

class Report_Screen extends StatelessWidget {
  Friend targetUser;
  Report_Screen({
     Key? key,
      required this.targetUser,
     }) : super(key: key);

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
        // leading: GestureDetector(
        //   onTap: () {},
        //   child: Icon(Icons.menu, color: Colors.white,),
        // ),
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
      body: Report_Body(targetUser: targetUser,),
    );
  }
}