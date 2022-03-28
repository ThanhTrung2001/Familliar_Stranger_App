import 'package:flutter/material.dart';

class Home_BG extends StatelessWidget {
  final Widget child;
  const Home_BG({ Key? key, required this.child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // stops: [
              //   0.1,
              //   0.4,
              //   0.6,
              //   0.9,
              // ],
              colors: [
                Color.fromARGB(255, 83, 59, 91),
                Colors.black,
              ],
            )
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              //bottom_Ellipse
              Positioned(
                bottom: 0,
                child: Image.asset(
                  "assets/Images/BigBottom_Center_Ellipse.png",
                  width: size.width,
                  height: size.height,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            Positioned(
                top: -size.width*0.18,
                left: -size.height*0.1,
                child: Image.asset(
                  "assets/Images/Ellipse_Home3.png",
                  width: size.width,
                  height: size.height,
                  alignment: Alignment.center,
                ),
              ),
            Positioned(
                top: size.width*0.07,
                left: size.width* 0.18,
                child: Image.asset(
                  "assets/Images/Ellipse_Home2.png",
                  width: size.width,
                  height: size.height,
                  alignment: Alignment.center,
                ),
              ),
              Positioned(
                top: size.width*0.2,
                left: size.width* 0.35,
                child: Image.asset(
                  "assets/Images/Ellipse_Home1.png",
                  width: size.width,
                  height: size.height,
                  alignment: Alignment.center,
                ),
              ),
              child,
            ],
          ),
    );
  }
}