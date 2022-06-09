import 'dart:convert';
import 'dart:io';

import 'package:familiar_stranger/Component/Button/Icon_ButtonRounded.dart';
import 'package:familiar_stranger/Component/Button/borderRounded_Female_Icon_Button.dart';
import 'package:familiar_stranger/Component/Button/borderRounded_Male_Icon_Button.dart';
import 'package:familiar_stranger/Component/Button/rounded_Border.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_Loading.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_ThreeTF.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Edit_Profile.dart';
import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/component/friendList_Body.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/component/profile_BG.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/profile.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/network/restApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Profile_Body extends StatefulWidget {
  const Profile_Body({Key? key}) : super(key: key);

  @override
  State<Profile_Body> createState() => _Profile_BodyState();
}

class _Profile_BodyState extends State<Profile_Body> {

  Future pickImage() async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        showDialog(
            barrierDismissible:
                false, // this one prevent closing Dialog when click outside
            context: context,
            builder: (context) {
              //Time delay for Loading Dialog to get the result from login
              Future.delayed(Duration(seconds: 3), () async {
                await uploadAvatar(image!.path.toString());
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profile_Screen();
                }));
              });
              return Dialog_Custom_Loading(
                dialog_content: "Uploading...",
                dialog_image_link: 'assets/Icons/Loading_Sign.png',
              );
            });
      } else {
        print('sos');
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  //press change sex icon background
  //bool set_male = true;
  Color bGColorMale = Colors.green.shade300;
  Color bGCOlorFemale = Colors.pink.shade300;

  void press_icon() {
    setState(() {
      sex_male = !sex_male;
    });
  }

  void isMale() {
    if (sex_male == true) {
    } else {
      press_icon();
    }
  }

  void isFemale() {
    if (sex_male == false) {
      bGCOlorFemale = Colors.transparent;
      bGColorMale = Colors.green.shade300;
    } else {
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
              Text(
                "UID : " + user.id,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Main_Text),
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: user.id));
                },
                icon: const Icon(
                  Icons.copy,
                  color: Main_Text,
                ),
                iconSize: 20,
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Border_Color,
            radius: 100.0,
            child: InkWell(
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatarUrl),
                radius: 95.0,
              ),
              onTap: () {
                pickImage();
              },
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width * 0.06,
              ),
              Text(
                "Name :",
                style: TextStyle(
                    color: Main_Text,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              Container(
                  width: 280,
                  height: 50,
                  child: Rounded_TextField_Center(
                    textInputType: TextInputType.name,
                    IsPassword: false,
                    hint: user.userName,
                    onchanged: (value) {
                      account_name = value;
                    },
                    validate: false,
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width * 0.086,
              ),
              Text(
                "Age :",
                style: TextStyle(
                    color: Main_Text,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              Container(
                  width: 120,
                  height: 70,
                  child: Rounded_TextField_Center(
                    textInputType: TextInputType.number,
                    IsPassword: false,
                    hint: user.age,
                    onchanged: (value) {
                      age = value;
                    },
                    validate: false,
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width * 0.086,
              ),
              Text(
                "Sex :",
                style: TextStyle(
                    color: Main_Text,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              SizedBox(
                width: size.width * 0.015,
              ),
              Icon_Button_Rounded(
                bordercolor: Main_Text,
                iconcolor: male_icon_color,
                press: isMale,
                icons: Icons.male_rounded,
                icon_size: 30,
                widthSize: size.width * 0.2,
                backgroundColor:
                    (sex_male == true) ? bGColorMale : Colors.transparent,
              ),
              SizedBox(
                width: 10,
              ),
              Icon_Button_Rounded(
                bordercolor: Main_Text,
                iconcolor: female_icon_color,
                press: isFemale,
                icons: Icons.female_rounded,
                icon_size: 30,
                widthSize: size.width * 0.2,
                backgroundColor:
                    (sex_male == false) ? bGCOlorFemale : Colors.transparent,
              ),
            ],
          ),
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Rounded_Border_Button(
                text: "SAVE",
                bordercolor: Main_Text,
                textcolor: Main_Text,
                press: () {
                  //print(account_name+ ''+ age + set_male.toString());
                  submitUpdate(account_name, age);
                  user.userName = account_name;
                  user.age = age;
                  setState(() {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Profile_Screen();
                    }));
                  });
                },
                horizon: 23,
                verti: 10),
            SizedBox(
              width: size.width * 0.08,
            ),
            Rounded_Border_Button(
                text: "CANCEL",
                bordercolor: Sub_Text,
                textcolor: Sub_Text,
                press: () {},
                horizon: 15,
                verti: 10),
          ]),
          SizedBox(
            height: size.height * 0.025,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog_Input_Three(press_yes: () async {
                            if (change_password != retype_password) {
                              print('Input new_pass and retype_pass again');
                            } else {
                              var result = await changePassword(
                                  old_password, change_password);
                              if (result == 'done') {
                                print('change password successful');
                                Navigator.pop(context);
                              } else if (result == 'dont match') {
                                ////Toast
                                print(
                                    'Old password incorrect, input again pls');
                              } else {
                                print('err change pass');
                              }
                            }
                          });
                        });
                  },
                  child: Text(
                    "Change password?",
                    style: TextStyle(
                      color: Sub_Text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
