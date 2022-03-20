import 'package:flutter/material.dart';

class Login_BG extends StatelessWidget {
  final Widget child;
  const Login_BG({ Key? key, required this.child, }) : super(key: key);

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
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/Images/ellipse1.png",
              width: size.width,
              alignment: Alignment.topRight,
            ),
          ),
          Positioned(
            top: size.height*0.18,
            child: Text(
                    "FS",
                    style: TextStyle(
                    fontFamily: 'UncialAntiqua',
                    fontSize: 64,
                    color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    ),
                    ),
          Positioned(
            top: size.height*0.3,
            child: Text(
                          "Familiar Stranger",
                          style: TextStyle(
                          fontFamily: 'ZenDots',
                          fontSize: 20,
                          color: Colors.white,
                    ),
                    ),
                    ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/Images/ellipse2.png",
              width: size.width,
              alignment: Alignment.bottomLeft,
            ),
          ),
          child,
        ],
      ),
      );
  }
}