import 'package:familiar_stranger/Component/Button/dialog_Button.dart';
import 'package:familiar_stranger/Component/TextField/Common/textfield_input_dialog.dart';
import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

//Dialog_Input_UID_Friend
class Dialog_Input_Three extends StatelessWidget {
  final VoidCallback press_yes;
  const Dialog_Input_Three({ 
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
      height: size.height*0.45,
      width: size.width*0.8,
      decoration: BoxDecoration(
        border: Border.all(width: 5.0, color: Color.fromARGB(255, 99, 53, 156)),
        color: Color.fromARGB(255, 220, 146, 231),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    child: Column(
      
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("Change Password?", style: TextStyle(fontFamily: 'ZenDots', fontSize: 20, color: Main_Text),textAlign: TextAlign.center,),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField_Input_Dialog(onchanged: (value){old_password = value ; }, hint: "Old Password", IsPassword: true, textInputType: TextInputType.number),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField_Input_Dialog(onchanged: (value){change_password = value ; }, hint: "New Password", IsPassword: true, textInputType: TextInputType.number),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField_Input_Dialog(onchanged: (value){retype_password = value ; }, hint: "Retype New Password ", IsPassword: true, textInputType: TextInputType.number),
        ),

        Padding(
          padding: EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Rounded_Border_Dialog_Button(text: "Change", bordercolor: Main_Text, textcolor: Main_Text, press:press_yes , horizon: 13, verti: 10),
              SizedBox(width: size.width*0.12,),
              Rounded_Border_Dialog_Button(text: "Cancel", bordercolor: Sub_Text, textcolor: Sub_Text, press: (){Navigator.of(context).pop();} , horizon: 13, verti: 10),
            ],
          ),
          ),
      ],
    ),
  ),
    );
  }
}