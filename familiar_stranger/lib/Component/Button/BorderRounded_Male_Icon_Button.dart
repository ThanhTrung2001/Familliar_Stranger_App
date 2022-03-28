import 'package:flutter/material.dart';

class Border_Male_Icon_Button extends StatelessWidget {
  final double icon_size;
  final Color bordercolor, iconcolor, backgroundcolor;
  final VoidCallback press;
  const Border_Male_Icon_Button({
    Key? key,
    required this.bordercolor,
    required this.iconcolor,
    required this.backgroundcolor,
    required this.press,
    required this.icon_size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: bordercolor, width: 2),
        color: backgroundcolor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: press,
         icon: Icon(Icons.male, color:iconcolor),
         iconSize: icon_size,),
    );
  }
}