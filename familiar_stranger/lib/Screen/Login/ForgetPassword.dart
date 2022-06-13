import 'package:familiar_stranger/Screen/Login/component/body/forget_Body.dart';
import 'package:flutter/material.dart';

class Forget_Screen extends StatelessWidget {
  const Forget_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
      child: Forget_Body(),
      ),
    );
  }
}