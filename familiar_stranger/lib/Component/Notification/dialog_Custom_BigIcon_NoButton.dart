import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Dialog_BigIcon_NoButton extends StatelessWidget {
  final String dialog_image_link;
  final String dialog_content;
  const Dialog_BigIcon_NoButton({ 
    Key? key,
    required this.dialog_image_link,
    required this.dialog_content,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Transp_Color,
      child: Container(
      height: size.height*0.28,
      width: size.width*0.8,
      decoration: BoxDecoration(
        border: Border.all(width: 5.0, color: Color.fromARGB(255, 99, 53, 156)),
        color: Color.fromARGB(255, 220, 146, 231),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(dialog_image_link,  height: 100, width: 100,),
        Padding(
          padding: EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 20),
          child: Text(dialog_content, style: TextStyle(fontFamily: 'ZenDots', fontSize: 18, color: Main_Text),textAlign: TextAlign.center,),
          ),
      ],
    ),
  ),
    );
  }
}