import 'package:familiar_stranger/Component/TextField/Login/textField_Container.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Rounded_TextField_Input extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged onchanged;
  final String label;
  final bool validate;
  const Rounded_TextField_Input({
    Key? key,
    required this.onchanged,
    required this.label,
    required this.validate, 
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField_Container(
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        onChanged: onchanged,
        style: TextStyle(color: Main_Text, fontSize: 18, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.people,size: 30,color: Border_Color,),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Border_Color, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ), 
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Border_Color, width: 2.0,),
          ),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Border_Color, width: 2.0,),),
          labelText: label, labelStyle: TextStyle(color: Main_Text, fontSize: 15, backgroundColor: Transp_Color),
          fillColor: Colors.transparent,
          errorText: validate ? 'Value Can\'t Be Empty' : null,
        ),
      ),
    );
  }
}