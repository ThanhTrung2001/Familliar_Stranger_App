import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Icon_Button_Rounded extends StatelessWidget {
  final double icon_size;
  final IconData icons;
  final double widthSize;
  final Color bordercolor, iconcolor,backgroundColor;
  final VoidCallback press;
  const Icon_Button_Rounded({
    Key? key,
    required this.bordercolor,
    required this.iconcolor,
    required this.backgroundColor,
    required this.press,
    required this.icons,
    required this.widthSize,
    required this.icon_size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 45,
      width: widthSize, //size.width*0.55,
      decoration: BoxDecoration(
        border: Border.all(color: bordercolor, width: 3.5),
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: GestureDetector(
        onTap: press,
        child: Icon(icons,size: icon_size,color: iconcolor,),
      ),
    );
  }
}