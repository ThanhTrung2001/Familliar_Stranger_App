import 'package:familiar_stranger/Component/Button/rounded_Border.dart';
import 'package:familiar_stranger/Component/Divider/orDivider.dart';
import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
import 'package:familiar_stranger/Screen/Login/login.dart';
import 'package:familiar_stranger/Screen/Login/component/login_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Verify_Body extends StatelessWidget {
  const Verify_Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Login_BG(
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
          SizedBox(height: size.height*0.32,),
          SizedBox(
                      width: 202,
                      child: Text("Please Enter the Code that have send to your phone :",style: TextStyle(color: Main_Text, fontSize: 14, fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
                    ),
          SizedBox(height: size.height*0.15,),          
          Rounded_TextField_Center(textInputType: TextInputType.number,IsPassword : true,hint: "_ _ _ _" ,onchanged: (value){VerifyCode = value;},),
          SizedBox(height: size.height*0.025,),
          Rounded_Border_Button(text: "VERIFY", bordercolor: Border_Color, textcolor: Main_Text, press: (){}, horizon: 30.0, verti: 15.0),
          OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return Login_Screen();}));},
                  child: Text(
                      "Already have an account?",
                      style: TextStyle(color: Sub_Text, fontWeight: FontWeight.bold,) ,),
                ),
              )
            ],
          )
         ],
      ),
    );
  }
}

