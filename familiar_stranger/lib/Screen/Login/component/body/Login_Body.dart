import 'dart:convert';
import 'package:familiar_stranger/Component/Button/rounded_Border.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_Loading.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_NoButton.dart';
import 'package:familiar_stranger/Component/TextField/Login/Rounded_TextField_Input.dart';
import 'package:familiar_stranger/Component/TextField/Login/Rounded_TextField_Password.dart';
import 'package:familiar_stranger/Screen/Home/Home.dart';
import 'package:familiar_stranger/Screen/Home/component/Home_Body.dart';
import 'package:familiar_stranger/Screen/Login/signup.dart';
import 'package:familiar_stranger/Screen/Login/component/login_BG.dart';
import 'package:familiar_stranger/Screen/Login/component/check/login_Or_SignUp.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/user.dart';
import 'package:familiar_stranger/network/restApi.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Login_Body extends StatelessWidget {
  const Login_Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Input-Username & Password

    return Login_BG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height*0.32,),
          Rounded_TextField_Input(label: "PhoneNumber",onchanged: (value){PhoneNumber = value;},),
          SizedBox(height: size.height*0.015,),
          Rounded_TextField_Password(label: "Password",onchanged: (value){Password = value;},),
          SizedBox(height: size.height*0.05,),
          //Login Event and Dialog_Loading, Error, Success showing
          Rounded_Border_Button(
            horizon: 30.0, 
            verti: 15.0,
            text: "LOG IN",
            bordercolor: Border_Color,
            textcolor: Sub_Text,
              press: () async {
                print (PhoneNumber + " " +Password);
                if(await submitLogin(PhoneNumber, Password) == true){
                  if(await getListFriend())
                    print('get success');
                  print(user.id);
                    showDialog(
                      barrierDismissible: false, // this one prevent closing Dialog when click outside
                      context: context,
                      builder: (context) {
                      //Time delay for Loading Dialog to get the result from login
                        Future.delayed(Duration(seconds: 3), (){
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context){return Home_Screen();}));
                        });
                      return Dialog_Custom_Loading(dialog_content: "Loading...", dialog_image_link: 'assets/Icons/Loading_Sign.png',);
                      }
                    );
                }
              }
          ),

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




