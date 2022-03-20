import 'package:familiar_stranger/Component/Button/Rounded_Border.dart';
import 'package:familiar_stranger/Component/Divider/OrDivider.dart';
import 'package:familiar_stranger/Component/TextField/Login/Rounded_TextField_Center.dart';
import 'package:familiar_stranger/Screen/Login/ForgetPassword.dart';
import 'package:familiar_stranger/Screen/Login/Login.dart';
import 'package:familiar_stranger/Screen/Login/component/Login_BG.dart';
import 'package:familiar_stranger/Screen/Login/component/check/Login_Or_SignUp.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class SignUp_Body extends StatelessWidget {
  const SignUp_Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Input-Username & Password
    String PhoneNumber;
    String Password;
    String RetypePassword;
    return Login_BG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height*0.32,),
          Rounded_TextField_Center(textInputType: TextInputType.number,IsPassword: false,hint: "PhoneNumber",onchanged: (value){PhoneNumber = value;},),
          SizedBox(height: size.height*0.015,),
          Rounded_TextField_Center(textInputType: TextInputType.none,IsPassword: true,hint: "Password",onchanged: (value){Password = value;},),
          SizedBox(height: size.height*0.015,),
          Rounded_TextField_Center(textInputType: TextInputType.none,IsPassword: true,hint: "Retype Password",onchanged: (value){RetypePassword = value;},),
          SizedBox(height: size.height*0.05,),
          Rounded_Border_Button(horizon: 30.0, verti: 15.0,text: "SIGN UP", bordercolor: Border_Color, textcolor: Sub_Text, press: (){}),
          SizedBox(height: size.height*0.05,),
          Check_LogIn_Or_SignUp( 
            login: false,
            press: (){Navigator.push(context, MaterialPageRoute(builder: (context){return Login_Screen();},
            ),
            );},
            ),
          OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return Forget_Screen();}));},
                  child: Text(
                      "Forgot your password?",
                      style: TextStyle(color: Sub_Text, fontWeight: FontWeight.bold,) ,),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

