import 'package:flutter/material.dart';

class Welcomge_BG extends StatelessWidget {
  final Widget child;
  const Welcomge_BG({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Image.asset(
              "assets/Images/welcomeBG.png",
              width: size.width,
            ),
          ),
          child,
        ],
      ),
      );
  }
}