import 'package:familiar_stranger/Screen/Profile&Setting/component/setting_Body.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Setting_Screen extends StatelessWidget {
  const Setting_Screen({ Key? key }) : super(key: key);

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
        ),  
      ),
      body:  Setting_Body(),
    );
  }
}