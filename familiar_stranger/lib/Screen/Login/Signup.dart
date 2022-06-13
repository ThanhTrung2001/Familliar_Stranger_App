
import 'package:familiar_stranger/Screen/Login/component/body/Signup_Body.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class SignUp_Screen extends StatelessWidget {
  const SignUp_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
      child: SingUp_Body()
      ),
    );
  }
}