import 'package:familiar_stranger/Screen/Login/component/body/Login_Body.dart';
import 'package:flutter/material.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login_Body(),
    );
  }
}