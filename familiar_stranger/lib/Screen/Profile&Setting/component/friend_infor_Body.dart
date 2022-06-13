import 'package:familiar_stranger/Component/Button/Icon_ButtonRounded.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_BigIcon_NoButton.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_LogOut.dart';
import 'package:familiar_stranger/Component/NavBar/Route.dart';
import 'package:familiar_stranger/Screen/ChatRoom/chatRoom.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/component/profile_BG.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/friendList.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/report.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:familiar_stranger/network/restApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Friend_Info_Body extends StatefulWidget {
  //Define Friend -> targetUser;
  Friend targetUser;
  Friend_Info_Body({Key? key, required this.targetUser}) : super(key: key);

  @override
  State<Friend_Info_Body> createState() => _Friend_Info_BodyState();
}

class _Friend_Info_BodyState extends State<Friend_Info_Body> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //socket.off('acceptConversation');
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
                "UID : " + targetUser.userId,
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
                  Clipboard.setData(ClipboardData(text: targetUser.userId));
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
            child: CircleAvatar(
              backgroundImage: NetworkImage(targetUser.avatarUrl),
              radius: 95.0,
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(targetUser.username,
                  style: TextStyle(
                      color: Main_Text,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              SizedBox(
                width: size.width * 0.01,
              ),
              Icon(
                (targetUser.sex == 'male') ? Icons.male : Icons.female,
                color: (targetUser.sex == 'male')
                    ? male_icon_color
                    : female_icon_color,
                size: 30,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Age : " + targetUser.age,
                style: TextStyle(
                    fontSize: 16,
                    color: Main_Text,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon_Button_Rounded(
                  bordercolor: Main_Text,
                  iconcolor: Main_Text,
                  press: () {
                    showDialog(
                        barrierDismissible: false, // this one prevent closing Dialog when click outside
                        context: context,
                        builder: (context) {
                          acceptConversation = false;
                          if (targetUser.recentState) {
                            socket.emit('invite', {user.id, targetUser.userId});
                          } else {
                            print('targer off');
                          }
                          Future.delayed(const Duration(seconds: 10), () async {
                            if(!acceptConversation){
                              print(acceptConversation);
                              Navigator.of(context).pop();
                            }
                          });
                          //Time delay for Loading Dialog to get the result from login
                          return Dialog_BigIcon_NoButton(
                            dialog_content:
                                "Request!\nWait reponse for 10 seconds...",
                            dialog_image_link: 'assets/Icons/Check_Circle.png',
                          );
                        });
                        Fluttertoast.showToast(
                              msg: "Request Send!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color.fromARGB(255, 22, 57, 153),
                              textColor: Colors.white,
                              fontSize: 16.0
                              );
                  },
                  icons: Icons.message_rounded,
                  icon_size: 30,
                  widthSize: size.width * 0.55,
                  backgroundColor: Transp_Color,
                ),
                SizedBox(
                  height: 10,
                ),
                Icon_Button_Rounded(
                  bordercolor: Border_Color,
                  iconcolor: Border_Color,
                  press: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog_LogOut(
                              title: "Delete him/her?",
                              press_yes: () async {
                                if (await submitDeleteFriend(
                                    targetUser.userId)) {
                                  setState(() {
                                    //where to delete it from sever and back to friend list
                                    //  recentChats.remove(select);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    listFriend.remove(targetUser);
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return FriendList_Screen();
                                    }));
                                  });
                                }
                              });
                        });
                  },
                  icons: Icons.delete_rounded,
                  icon_size: 30,
                  widthSize: size.width * 0.55,
                  backgroundColor: Transp_Color,
                ),
                SizedBox(
                  height: 10,
                ),
                Icon_Button_Rounded(
                  bordercolor: Colors.red,
                  iconcolor: Colors.red,
                  press: () {
                    //Must define the Friend target User First, then go to report screen wwith targetUser;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => Report_Screen(
                                targetUser: targetUser,
                              )),
                    );
                  },
                  icons: Icons.report_rounded,
                  icon_size: 30,
                  widthSize: size.width * 0.55,
                  backgroundColor: Transp_Color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
