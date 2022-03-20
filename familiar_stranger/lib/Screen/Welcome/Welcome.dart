import 'package:familiar_stranger/Screen/Welcome/component/Welcome_Body.dart';
import 'package:flutter/material.dart';

class Welcome_Screen extends StatelessWidget {
  const Welcome_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Welcome_Body(),
    );
  }
}