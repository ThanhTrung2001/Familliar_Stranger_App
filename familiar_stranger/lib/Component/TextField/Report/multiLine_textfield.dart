import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class MultiLine_textfiled extends StatelessWidget {
  const MultiLine_textfiled({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      width: size.width*0.78,
      child: TextField(
        maxLines: 7,
        textAlign: TextAlign.left,
        onChanged: (value){ report_other = value;},
        style: TextStyle(color: Main_Text, fontSize: 14, fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Border_Color, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ), 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Border_Color, width: 2.0,),
                ),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Border_Color, width: 2.0,),),
                fillColor: Colors.transparent,                                  
              ),
      ),
    );
  }
}