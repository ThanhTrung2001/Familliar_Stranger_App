import 'package:familiar_stranger/Component/Button/dialog_Button.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Dialog_AcceptInvite extends StatelessWidget {
  final VoidCallback press_yes;
  const Dialog_AcceptInvite({ 
    Key? key,
    required this.press_yes,
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
      height: size.height*0.35,
      width: size.width*0.8,
      decoration: BoxDecoration(
        border: Border.all(width: 5.0, color: Color.fromARGB(255, 99, 53, 156)),
        color: Color.fromARGB(255, 220, 146, 231),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/Icons/Ok_Hand.png'),
        SizedBox(height: 10,),
        Text("Opponent found! Join room?", style: TextStyle(fontFamily: 'ZenDots', fontSize: 20, color: Main_Text),textAlign: TextAlign.center,),
        Padding(
          padding: EdgeInsets.only(top: 40, right: 10, left: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Rounded_Border_Dialog_Button(text: "Yes", bordercolor: Main_Text, textcolor: Main_Text, press: press_yes , horizon: 20, verti: 10),
              SizedBox(width: size.width*0.12,),
              Rounded_Border_Dialog_Button(text: "No", bordercolor: Sub_Text, textcolor: Sub_Text, press: (){Navigator.of(context).pop();} , horizon: 23, verti: 10),
            ],
          ),
          ),
      ],
    ),
  ),
    );
  }
}