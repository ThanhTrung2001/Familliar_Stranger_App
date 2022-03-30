import 'package:familiar_stranger/Screen/Login/component/body/signup_Body.dart';
import 'package:flutter/material.dart';

class SignUp_Screen extends StatelessWidget {
  const SignUp_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView( 
      child: SignUp_Body(),
      ),
    );
  }
}