import 'package:familiar_stranger/Screen/Welcome/component/welcome_Body.dart';
import 'package:flutter/material.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
      child: Welcome_Body(),
      ),
    );
  }
}