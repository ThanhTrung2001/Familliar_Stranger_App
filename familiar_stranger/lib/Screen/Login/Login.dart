import 'package:familiar_stranger/Screen/Login/component/body/login_Body.dart';
import 'package:flutter/material.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Login_Body(),
    );
  }
}