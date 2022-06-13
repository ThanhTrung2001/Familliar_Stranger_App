import 'package:flutter/material.dart';

class Rounded_Border_Button extends StatelessWidget {
  final String text;
  final double horizon, verti;
  final Color bordercolor, textcolor;
  final VoidCallback press;
  const Rounded_Border_Button({
    Key? key,
    required this.text,
    required this.bordercolor,
    required this.textcolor,
    required this.press,
    required this.horizon,
    required this.verti,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: horizon, vertical: verti),
            shape: RoundedRectangleBorder(side: BorderSide(color: bordercolor, width: 3, style: BorderStyle.solid), borderRadius: BorderRadius.circular(5.0),)),
          onPressed: press,
          child: Text(text ,style: TextStyle(color: textcolor, fontWeight: FontWeight.bold, fontSize: 16,),),
        ),
      ),
    );
  }
}