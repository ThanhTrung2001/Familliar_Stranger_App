import 'dart:convert';
import 'package:familiar_stranger/Component/Button/rounded_Border.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_BigIcon_NoButton.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_Loading.dart';
import 'package:familiar_stranger/Component/Divider/orDivider.dart';
import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
import 'package:familiar_stranger/Screen/Login/forgetPassword.dart';
import 'package:familiar_stranger/Screen/Login/login.dart';
import 'package:familiar_stranger/Screen/Login/component/login_BG.dart';
import 'package:familiar_stranger/Screen/Login/component/check/login_Or_SignUp.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/user.dart';
import 'package:familiar_stranger/network/restApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingUp_Body extends StatefulWidget {
  const SingUp_Body({Key? key}) : super(key: key);

  @override
  State<SingUp_Body> createState() => _SingUp_BodyState();
}

class _SingUp_BodyState extends State<SingUp_Body> {
  bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;

  void checkNull() {
    if (PhoneNumber == "") {
      this.setState(() {
        _validate1 = true;
      });
      if (Password == "") {
        this.setState(() {
          _validate2 = true;
        });
        if (RetypePassword == "") {
          this.setState(() {
            _validate3 = true;
          });
        } else {
          this.setState(() {
            _validate3 = false;
          });
        }
      } else {
        this.setState(() {
          _validate2 = false;
        });
        if (RetypePassword == "") {
          this.setState(() {
            _validate3 = true;
          });
        } else {
          this.setState(() {
            _validate3 = false;
          });
        }
      }
    } else {
      _validate1 = false;
      if (Password == "") {
        this.setState(() {
          _validate2 = true;
        });
        if (RetypePassword == "") {
          this.setState(() {
            _validate3 = true;
          });
        } else {
          this.setState(() {
            _validate3 = false;
          });
        }
      } else {
        this.setState(() {
          _validate2 = false;
        });
        if (RetypePassword == "") {
          this.setState(() {
            _validate3 = true;
          });
        } else {
          this.setState(() {
            _validate3 = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //Input-Username & Password
    PhoneNumber = "";
    Password = "";
    RetypePassword = "";
    return Login_BG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.32,
          ),
          Rounded_TextField_Center(
            textInputType: TextInputType.number,
            IsPassword: false,
            hint: "PhoneNumber",
            onchanged: (value) {
              PhoneNumber = value;
            },
            validate: _validate1,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          Rounded_TextField_Center(
            textInputType: TextInputType.visiblePassword,
            IsPassword: true,
            hint: "Password",
            onchanged: (value) {
              Password = value;
            },
            validate: _validate2,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          Rounded_TextField_Center(
            textInputType: TextInputType.visiblePassword,
            IsPassword: true,
            hint: "Retype Password",
            onchanged: (value) {
              RetypePassword = value;
            },
            validate: _validate3,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Rounded_Border_Button(
              horizon: 30.0,
              verti: 15.0,
              text: "SIGN UP",
              bordercolor: Border_Color,
              textcolor: Sub_Text,
              press: () async {
                print(PhoneNumber + " " + Password + " " + RetypePassword);
                checkNull();
                if (Password == RetypePassword &&
                    PhoneNumber != "" &&
                    Password != "") {
                  if (await submitSignUp(PhoneNumber, Password)) {
                    Navigator.of(context).pop();
                    showDialog(
                        barrierDismissible:
                            false, // this one prevent closing Dialog when click outside
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.of(context).pop();
                          });
                          return Dialog_Custom_Loading(
                            dialog_content: "Sign Up Successful",
                            dialog_image_link: 'assets/Icons/Loading_Sign.png',
                          );
                        });
                  } else {
                    showDialog(
                        // barrierDismissible:
                        //     false, // this one prevent closing Dialog when click outside
                        context: context,
                        builder: (context) {
                          //Time delay for Loading Dialog to get the result from login
                          return Dialog_BigIcon_NoButton(
                            dialog_content: "Phone Number has been registered!",
                            dialog_image_link: 'assets/Icons/Cancel.png',
                          );
                        });
                  }
                }
              }),
          SizedBox(
            height: size.height * 0.02,
          ),
          Check_LogIn_Or_SignUp(
            login: false,
            press: () {
              Navigator.of(context).pop();
            },
          ),
          OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Forget_Screen();
                    }));
                  },
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      color: Sub_Text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
