import 'package:flutter/material.dart';

class ChatRoom_BG extends StatelessWidget {
  final Widget child;
  const ChatRoom_BG({ Key? key , required this.child }) : super(key: key);

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
             Positioned(
               left: 0,
               top: size.height * 0.06,
               child: Image.asset(
                 "assets/Images/Ellipse_ChatRoom1.png",
                  alignment: Alignment.centerLeft,
                 )
               ),
               Positioned(
               right: 0,
               top: size.height * 0.37,
               child: Image.asset(
                 "assets/Images/Ellipse_ChatRoom2.png",
                  alignment: Alignment.centerRight,
                 )
               ),
               Positioned(
               left: size.width*0.13,
               top: size.height * 0.74,
               child: Image.asset(
                 "assets/Images/Ellipse_ChatRoom3.png",
                  alignment: Alignment.center,
                 )
               ),
             child,
           ],
        ),
    );
  }
}