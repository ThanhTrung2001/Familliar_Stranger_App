import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Check_LogIn_Or_SignUp extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const Check_LogIn_Or_SignUp({
    Key? key, 
    this.login = true, 
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text( 
              login ? "Don't have an account?  " : "Already have an account?  ",
              style: TextStyle(color: Main_Text),
              ),
        GestureDetector(
          onTap: press,
          child: Text(
                login ? "SIGN UP" : "SIGN IN",
                 style: TextStyle(color: Sub_Text, fontWeight: FontWeight.bold,) ,),
        )
      ],
    );
  }
}
