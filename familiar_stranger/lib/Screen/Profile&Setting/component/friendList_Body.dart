import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
import 'package:familiar_stranger/Model_Test/message_model.dart';
import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/Screen/ChatRoom/chatRoom.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/component/profile_BG.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/friendmodel/friendmodel.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class FrindList_Body extends StatefulWidget {
  const FrindList_Body({ Key? key }) : super(key: key);

  @override
  State<FrindList_Body> createState() => _FrindList_BodyState();
}
String username = "";
class _FrindList_BodyState extends State<FrindList_Body> {
  List<bool> isSelected = [false, true, false];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Profile_PG(
      child: Column(
        children: <Widget>[
          ToggleButtons(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30 ),
                child: Text("Free", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30 ),
                child: Text("All", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30 ),
                child: Text("Off", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),),
              ),
            ],
            onPressed: (int newIndex){
              setState(() {
                for(int index = 0; index < isSelected.length; index++)
                {
                  if(index == newIndex)
                  {
                      isSelected[index] = true;
                  }
                  else
                  {
                      isSelected[index] = false;
                  }
                }
              });
            },
            color: Sub_Text,
            borderRadius: BorderRadius.circular(10.0),
            borderWidth: 2.0,
            borderColor: Sub_Text,
            selectedColor: Main_Text,
            fillColor: Sub_Text,
            isSelected: isSelected,
            ), 
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: size.width*0.05,
                ),
                //Search Friend
                Container(
                  width: size.width * 0.4,
                  height: 50,
                  child: Rounded_TextField_Center(onchanged: (value){}, hint: "Seacrh...", IsPassword: false, textInputType: TextInputType.text),
                  ),
                  IconButton(
                    onPressed: (){},
                     icon: Icon(Icons.search,color: Main_Text,size: 30,),)
              ],
            ),
            SizedBox(
            ),
            //Call List friend 
            // Expanded(
            //   child:ListView.separated(
            //     itemCount: recentChats.length,
            //     itemBuilder: (context, index) { 
            //       final select = recentChats[index];
            //       return Friend_Model(avatar: select.sender.avatar,userName: select.sender.name,status: "Free",
            //       tap: (){
            //         //Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoom_Screen(user: select.sender,)));
            //         },);},
            //       separatorBuilder: (context, index) {
            //         return Divider(
            //           height: 3,
            //           indent: 30,
            //           endIndent: 30,
            //           color: Sub_Text,
            //         );
            //       },
            //     ),
            //     ),
        ],
      ),
    );
  }
}