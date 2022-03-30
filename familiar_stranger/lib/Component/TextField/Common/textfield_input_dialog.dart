import 'package:familiar_stranger/Component/TextField/Common/container_common.dart';
import 'package:familiar_stranger/Component/TextField/Login/textField_Container.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class TextField_Input_Dialog extends StatelessWidget {
  final ValueChanged onchanged;
  final String hint;
  final bool IsPassword;
  final TextInputType textInputType;
  const TextField_Input_Dialog({
    Key? key,
    required this.onchanged,
    required this.hint,
    required this.IsPassword,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container_Common(
      child: TextField(
      maxLines: 1,
      minLines: 1,
      obscureText: IsPassword,
      keyboardType: textInputType,
      textAlign: TextAlign.center,
      onChanged: onchanged,
      style: TextStyle(color: Main_Text, fontSize: 18, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Main_Text, width: 3.0), borderRadius: BorderRadius.circular(10.0),
        ), 
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Main_Text, width: 3.0,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Main_Text, width: 3.0,),
        ),
        hintText: hint, hintStyle: TextStyle(color: Sub_Text, fontSize: 15),
        fillColor: Colors.transparent,
    ),
      ),
    );
  }
}