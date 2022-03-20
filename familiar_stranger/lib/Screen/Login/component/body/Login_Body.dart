import 'package:familiar_stranger/Component/Button/Rounded_Border.dart';
import 'package:familiar_stranger/Component/TextField/Login/Rounded_TextField_Input.dart';
import 'package:familiar_stranger/Component/TextField/Login/Rounded_TextField_Password.dart';
import 'package:familiar_stranger/Screen/Login/Signup.dart';
import 'package:familiar_stranger/Screen/Login/component/Login_BG.dart';
import 'package:familiar_stranger/Screen/Login/component/check/Login_Or_SignUp.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Login_Body extends StatelessWidget {
  const Login_Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Input-Username & Password
    String PhoneNumber;
    String Password;
   
    return Login_BG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height*0.32,),
          Rounded_TextField_Input(label: "PhoneNumber",onchanged: (value){PhoneNumber = value;},),
          SizedBox(height: size.height*0.015,),
          Rounded_TextField_Password(label: "Password",onchanged: (value){Password = value;},),
          SizedBox(height: size.height*0.05,),
          Rounded_Border_Button(horizon: 30.0, verti: 15.0,text: "LOG IN", bordercolor: Border_Color, textcolor: Sub_Text, press: (){}),
          SizedBox(height: size.height*0.05,),
          Check_LogIn_Or_SignUp( 
            press: (){Navigator.push(context, MaterialPageRoute(builder: (context){return SignUp_Screen();},
            ),
            );},
            ),
        ],
      ),
    );
  }
}




