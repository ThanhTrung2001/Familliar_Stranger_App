// import 'package:familiar_stranger/Model_Test/message_model.dart';
// import 'package:familiar_stranger/Model_Test/user_model.dart';
// import 'package:familiar_stranger/Model_Test/message_model.dart';
import 'package:familiar_stranger/Model_Test/message_model.dart';
import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';
import 'package:familiar_stranger/models/user.dart';
// import 'package:familiar_stranger/models/message.dart';

//This class is dessign for every chatline in the chatroom
class Conservation extends StatefulWidget {
  // final User targetUser;
  final Userr targetUser; //test
  const Conservation({ Key? key, required this.targetUser, }) : super(key: key);

  @override
  State<Conservation> createState() => _ConservationState();
}

void setMessage(){
  // socket.on('message',(data){
  //   print(data['sourceId']);
  //   messages.add(Message(senderId: data['sourceId'], time: 'time', text: 'text'));
  //   print(messages);
  // });

}

class _ConservationState extends State<Conservation> {
  // void setMessage(){
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        reverse: true,
        itemCount: messages.length, // Test
        itemBuilder: (context, int index) {
          final message = messages[index]; //Test
          // bool isMe = message.senderId == user.id;
          bool isMe = message.sender.id == currentUser.id;
          return Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // if (!isMe)
                    //   CircleAvatar(
                    //     radius: 15,
                    //     backgroundImage: AssetImage(user.avatarUrl),
                    //   ),
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
                      child: Text(
                        messages[index].text,
                        style:TextStyle(
                            color: Main_Text),
                      ),
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