import 'package:familiar_stranger/Screen/Login/component/body/Forget_Body.dart';
import 'package:flutter/material.dart';

class Forget_Screen extends StatelessWidget {
  const Forget_Screen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Forget_Body(),
    );
  }
}