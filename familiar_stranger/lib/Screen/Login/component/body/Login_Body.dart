import 'dart:convert';
import 'package:familiar_stranger/Component/Button/rounded_Border.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_BigIcon_NoButton.dart';
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
import 'package:familiar_stranger/network/socket.dart';
import 'package:flutter/material.dart';

// class Login_Body extends StatelessWidget {
//   const Login_Body({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     //Input-Username & Password
    
//   }
// }

class Login_Body extends StatefulWidget {
  const Login_Body({ Key? key }) : super(key: key);

  @override
  State<Login_Body> createState() => _Login_BodyState();
}

class _Login_BodyState extends State<Login_Body> {
  bool _validate1 = false;
  bool _validate2 = false;

  void checkNull() //Check Input Null or Not
  {
      if(PhoneNumber == "" )
      {
        this.setState(() {
          _validate1 = true;
        });
        if(Password == "")
        {
          this.setState(() {
          _validate2 = true;
        });
        }
        else
        {
          this.setState(() {
          _validate2 = false;
        });
        }
      }
      else
      {
        this.setState(() {
          _validate1 = false;
        });
        if(Password == "")
        {
          this.setState(() {
          _validate2 = true;
        });
        }
        else
        {
          this.setState(() {
          _validate2 = false;
        });
        }
      }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PhoneNumber = "";
    Password = "";
    return Login_BG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.32,
          ),
          Rounded_TextField_Input(
            validate: _validate1,
            label: "PhoneNumber",
            onchanged: (value) {
              PhoneNumber = value;
            },
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Rounded_TextField_Password(
            validates: _validate2,
            label: "Password",
            onchanged: (value) {
              Password = value;
            },
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          //Login Event and Dialog_Loading, Error, Success showing
          Rounded_Border_Button(
              horizon: 30.0,
              verti: 15.0,
              text: "LOG IN",
              bordercolor: Border_Color,
              textcolor: Sub_Text,
              press: () async {
                print(PhoneNumber + " " + Password);
                checkNull();
                if (await submitLogin(PhoneNumber, Password) == true) {
                  connectSocket();
                  if (await getAllSongs()) print('get all song');
                  if (await getListFriend()) print('get list friend');
                  //print(user.id);
                  showDialog(
                      barrierDismissible:
                          false, // this one prevent closing Dialog when click outside
                      context: context,
                      builder: (context) {
                        //Time delay for Loading Dialog to get the result from login
                        Future.delayed(Duration(seconds: 3), () {
                          Navigator.of(context).pop();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Home_Screen();
                          }));
                        });
                        return Dialog_Custom_Loading(
                          dialog_content: "Loading...",
                          dialog_image_link: 'assets/Icons/Loading_Sign.png',
                        );
                      });
                }
                else
                {
                  showDialog(
                      // barrierDismissible:
                      //     false, // this one prevent closing Dialog when click outside
                      context: context,
                      builder: (context) {
                        //Time delay for Loading Dialog to get the result from login
                        return Dialog_BigIcon_NoButton(
                          dialog_content: "Wrong username/password!",
                          dialog_image_link: 'assets/Icons/Cancel.png',
                        );
                      });
                }
              }),

          SizedBox(
            height: size.height * 0.05,
          ),
          Check_LogIn_Or_SignUp(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUp_Screen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
