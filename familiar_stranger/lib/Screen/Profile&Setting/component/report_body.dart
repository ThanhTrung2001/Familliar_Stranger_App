import 'package:familiar_stranger/Component/Button/rounded_Border.dart';
import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
import 'package:familiar_stranger/Component/TextField/Report/multiLine_textfield.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/component/profile_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Report_Body extends StatefulWidget {
  const Report_Body({Key? key}) : super(key: key);

  @override
  State<Report_Body> createState() => _Report_BodyState();
}

class _Report_BodyState extends State<Report_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Profile_PG(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              "SETTING",
              style: TextStyle(
                  color: Main_Text, fontWeight: FontWeight.w900, fontSize: 20),
            ),
            Divider(
              height: 30,
              thickness: 3,
              color: Main_Text,
              indent: 175,
              endIndent: 175,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Sub_Text,
                          ),
                          child: Checkbox(
                            checkColor: Colors.white,
                            value: cb1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onChanged: (value) {
                              setState(() {
                                cb1 = value!;
                              });
                            },
                            activeColor: Color.fromARGB(255, 61, 141, 64),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Toxic",
                          style: TextStyle(fontSize: 16, color: Main_Text),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Sub_Text,
                          ),
                          child: Checkbox(
                            checkColor: Colors.white,
                            value: cb2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onChanged: (value) {
                              setState(() {
                                cb2 = value!;
                              });
                            },
                            activeColor: Color.fromARGB(255, 61, 141, 64),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Dirty Talk",
                          style: TextStyle(fontSize: 16, color: Main_Text),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Sub_Text,
                          ),
                          child: Checkbox(
                            checkColor: Colors.white,
                            value: cb3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onChanged: (value) {
                              setState(() {
                                cb3 = value!;
                              });
                            },
                            activeColor: Color.fromARGB(255, 61, 141, 64),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Insult to Honor and Dignity",
                          style: TextStyle(fontSize: 16, color: Main_Text),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Sub_Text,
                          ),
                          child: Checkbox(
                            checkColor: Colors.white,
                            value: cb4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onChanged: (value) {
                              setState(() {
                                cb4 = value!;
                              });
                            },
                            activeColor: Color.fromARGB(255, 61, 141, 64),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Other : ",
                          style: TextStyle(fontSize: 16, color: Main_Text),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          MultiLine_textfiled(size: size),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Rounded_Border_Button(
                                  text: "SEND",
                                  bordercolor: Main_Text,
                                  textcolor: Main_Text,
                                  press: () {},
                                  horizon: 30,
                                  verti: 18),
                              SizedBox(
                                width: size.width * 0.1,
                              ),
                              Rounded_Border_Button(
                                  text: "CANCEL",
                                  bordercolor: Sub_Text,
                                  textcolor: Sub_Text,
                                  press: () {},
                                  horizon: 21,
                                  verti: 18),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "More Information?",
                        style: TextStyle(color: Sub_Text, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
