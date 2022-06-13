import 'package:familiar_stranger/Screen/Login/component/body/verify_Body.dart';
import 'package:flutter/material.dart';

class Verify_Screen extends StatelessWidget {
  const Verify_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
      child: Verify_Body(),
      ),
    );
  }
}