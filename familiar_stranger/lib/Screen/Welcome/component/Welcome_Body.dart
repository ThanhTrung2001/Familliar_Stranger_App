import 'package:familiar_stranger/Component/Button/Rounded_Border.dart';
import 'package:familiar_stranger/Screen/Login/login.dart';
import 'package:familiar_stranger/Screen/Welcome/component/Welcome_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Welcome_Body extends StatelessWidget {
  const Welcome_Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Welcomge_BG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Welcome to Familiar Stranger",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Main_Text),
                ),
          SizedBox(height: size.height*0.2,),
          Rounded_Border_Button(text: "ENTER",
                                horizon: 15.0, verti: 15.0,
                                bordercolor: Border_Color,
                                textcolor: Sub_Text,
                                press: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Login_Screen()));},)
        ]
      ),
    );
  }
}

