import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class TextField_Container extends StatelessWidget {
  final Widget child;
  const TextField_Container({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Transp_Color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}