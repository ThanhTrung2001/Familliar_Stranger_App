import 'package:familiar_stranger/Component/Button/borderRounded_Female_Icon_Button.dart';
import 'package:familiar_stranger/Component/Button/borderRounded_Male_Icon_Button.dart';
import 'package:familiar_stranger/Component/Button/rounded_Border.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_ThreeTF.dart';
import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/component/profile_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Profile_Body extends StatefulWidget {
  const Profile_Body({ Key? key }) : super(key: key);

  @override
  State<Profile_Body> createState() => _Profile_BodyState();
}

class _Profile_BodyState extends State<Profile_Body> {
  
  //press change sex icon background
  bool set_male = true;
  Color bGColorMale = Colors.green.shade300;
  Color bGCOlorFemale = Colors.pink.shade300;
  

  void press_icon(){
    setState(() {
      set_male = !set_male;
    });
  }

  void isMale(){
    if(set_male == true)
    {
      
    }
    else
    {
      press_icon();
    }
  }

  void isFemale(){
    if(set_male == false)
    {
      
    }
    else
    {
      press_icon();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Profile_PG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("UID : $UID" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Main_Text),),
                  SizedBox(width: size.width* 0.01,),
                  IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.copy, color: Main_Text,), iconSize: 20,),
                    ],
                  ),
                  CircleAvatar(               
                    backgroundColor: Border_Color,
                    radius: 100.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('https://i.imgur.com/DSG7rkv.jpg'),
                      radius: 95.0,
                      ),
                    ),
                  SizedBox(height: size.height*0.025,),
                  Row(
                    children: <Widget>[
                    SizedBox(width: size.width * 0.06,),
                    Text("Name :", style: TextStyle(color: Main_Text, fontWeight: FontWeight.bold, fontSize: 17),),
                    Container(
                      width: 280,
                      height: 50,
                      child: Rounded_TextField_Center(textInputType: TextInputType.number,IsPassword: false,hint: "",onchanged: (value){account_name = value;},)
                      ),
                    ],
                    ),
                    Row(
                    children: <Widget>[
                    SizedBox(width: size.width * 0.086,),
                    Text("Age :", style: TextStyle(color: Main_Text, fontWeight: FontWeight.bold, fontSize: 17),),
                    Container(
                      width: 120,
                      height: 70,
                      child: Rounded_TextField_Center(textInputType: TextInputType.number,IsPassword: false,hint: "",onchanged: (value){account_name = value;},)
                      ),
                    ],
                    ),
                   Row(
                    children: <Widget>[
                    SizedBox(width: size.width * 0.086,),
                    Text("Sex :", style: TextStyle(color: Main_Text, fontWeight: FontWeight.bold, fontSize: 17),),
                    SizedBox(width: size.width * 0.015,),
                    Border_Male_Icon_Button(bordercolor: Border_Color, iconcolor: Colors.blue, press: isMale, icon_size: 25, backgroundcolor: (set_male == true)? bGColorMale : Colors.transparent,),
                    SizedBox(width: size.width * 0.03,),
                    Border_Female_Icon_Button(bordercolor: Border_Color, iconcolor: Colors.red, press: isFemale, icon_size: 25, backgroundcolor: (set_male == false)? bGCOlorFemale : Colors.transparent,),
                    ],
                    ),
          Spacer(),         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Rounded_Border_Button(text: "SAVE", bordercolor: Main_Text, textcolor: Main_Text, press: (){}, horizon: 23, verti: 10),
              SizedBox(width: size.width * 0.08,),
              Rounded_Border_Button(text: "CANCEL", bordercolor: Sub_Text, textcolor: Sub_Text, press: (){}, horizon: 15, verti: 10),
            ]
          ),
          SizedBox(height: size.height* 0.025,),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: (){
                    showDialog(context: context, builder: (context){ return Dialog_Input_Three(press_yes: (){print(old_password); print(change_password); print(retype_password);});});
                  },
                  child: Text(
                      "Change password?",
                      style: TextStyle(color: Sub_Text, fontWeight: FontWeight.bold,) ,),
                ),
              ),
              SizedBox(height: size.height * 0.025,),
            ],
          ),
        ],
      ),
    );
  }
}