import 'package:flutter/material.dart';

class Profile_PG extends StatelessWidget {
  final Widget child;
  const Profile_PG({ Key? key, required this.child }) : super(key: key);
  
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
            ),
          ),
           child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              child,
            ],
    ),
    );
  }
}