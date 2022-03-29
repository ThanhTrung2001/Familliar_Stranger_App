import 'package:familiar_stranger/Component/Button/rounded_Border.dart';
import 'package:familiar_stranger/Component/Divider/orDivider.dart';
import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
import 'package:familiar_stranger/Screen/Login/forgetPassword.dart';
import 'package:familiar_stranger/Screen/Login/login.dart';
import 'package:familiar_stranger/Screen/Login/component/login_BG.dart';
import 'package:familiar_stranger/Screen/Login/component/check/login_Or_SignUp.dart';
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
          SizedBox(height: size.height*0.005,),
          Rounded_TextField_Center(textInputType: TextInputType.none,IsPassword: true,hint: "Password",onchanged: (value){Password = value;},),
          SizedBox(height: size.height*0.005,),
          Rounded_TextField_Center(textInputType: TextInputType.none,IsPassword: true,hint: "Retype Password",onchanged: (value){RetypePassword = value;},),
          SizedBox(height: size.height*0.01,),
          Rounded_Border_Button(horizon: 30.0, verti: 15.0,text: "SIGN UP", bordercolor: Border_Color, textcolor: Sub_Text, press: (){}),
          SizedBox(height: size.height*0.02,),
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

