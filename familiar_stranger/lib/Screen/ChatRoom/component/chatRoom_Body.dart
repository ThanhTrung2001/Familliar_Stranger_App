import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/Screen/ChatRoom/chatmodel/conversation.dart';
import 'package:familiar_stranger/Screen/ChatRoom/chatmodel/inputbar.dart';
import 'package:familiar_stranger/Screen/ChatRoom/component/chatRoom_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class ChatRoom_Body extends StatefulWidget {
  final User user;
  const ChatRoom_Body({Key? key, required this.user}) : super(key: key);

  @override
  State<ChatRoom_Body> createState() => _ChatRoom_BodyState();
}

class _ChatRoom_BodyState extends State<ChatRoom_Body> {
  @override
  Widget build(BuildContext context) {
    return ChatRoom_BG(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Conservation(user: widget.user), //Get conservation
                ),
              ),
            ),

            //Bottom Input bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.transparent,
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Main_Text, fontSize: 14),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Border_Color, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Border_Color,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Border_Color,
                                    width: 3.0,
                                  ),
                                ),
                                hintText: 'Type your message ...',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  IconButton(
                    onPressed: () {
                      print(widget.user.name);
                    },
                    icon: Icon(
                      Icons.send,
                      size: 30,
                      color: Sub_Text,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
