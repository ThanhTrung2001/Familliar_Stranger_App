import 'package:familiar_stranger/Component/TextField/Login/textField_Container.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Rounded_TextField_Center extends StatelessWidget {
  final ValueChanged onchanged;
  final String hint;
  final bool IsPassword;
  final bool validate;
  final TextInputType textInputType;
  const Rounded_TextField_Center({
    Key? key,
    required this.onchanged,
    required this.hint,
    required this.IsPassword,
    required this.textInputType,
    required this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField_Container(
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
          borderSide: BorderSide(color: Border_Color, width: 2.0), borderRadius: BorderRadius.circular(10.0),
        ), 
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Border_Color, width: 2.0,),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Border_Color, width: 2.0,),
        ),
        hintText: hint, hintStyle: TextStyle(color: Sub_Text, fontSize: 15),
        fillColor: Colors.transparent,
        errorText: validate ? 'Value Can\'t Be Empty' : null,
    ),
      ),
    );
  }
}