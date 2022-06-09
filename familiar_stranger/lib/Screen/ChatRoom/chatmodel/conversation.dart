// import 'package:familiar_stranger/Model_Test/message_model.dart';
// import 'package:familiar_stranger/Model_Test/user_model.dart';
// import 'package:familiar_stranger/Model_Test/message_model.dart';
// import 'package:familiar_stranger/Model_Test/message_model.dart';
import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:flutter/material.dart';
//import 'package:familiar_stranger/models/user.dart';
import 'package:familiar_stranger/models/message.dart';

//This class is dessign for every chatline in the chatroom
class Conservation extends StatefulWidget {
  // final User targetUser;
  Friend targetUser; //test
  Conservation({
    Key? key,
    required this.targetUser,
  }) : super(key: key);

  @override
  State<Conservation> createState() => _ConservationState();
}

class _ConservationState extends State<Conservation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init conversation');
    //messages = [];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length, // Test
        itemBuilder: (context, int index) {
          final message = messages[index]; //Test
          bool isMe = message.senderId == user.id;
          return Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (!isMe)
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(targetUser.avatarUrl),
                      ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Sub_Text),
                          color: isMe ? Sub_Text : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(isMe ? 12 : 0),
                            bottomRight: Radius.circular(isMe ? 0 : 12),
                          )),
                      child: (!messages[index].isImage)
                          ? Text(
                              messages[index].text,
                              style: const TextStyle(color: Main_Text),
                            )
                          : Image.network(messages[index].text),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isMe)
                        SizedBox(
                          width: 40,
                        ),
                      Icon(
                        Icons.done_all,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        message.time,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
