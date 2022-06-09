// import 'package:familiar_stranger/Model_Test/user_model.dart';
// import 'package:familiar_stranger/Model_Test/message_model.dart';
// import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/Screen/ChatRoom/ChatRoom.dart';
import 'package:familiar_stranger/Screen/ChatRoom/chatmodel/conversation.dart';
import 'package:familiar_stranger/Screen/ChatRoom/chatmodel/inputbar.dart';
import 'package:familiar_stranger/Screen/ChatRoom/component/chatRoom_BG.dart';
import 'package:familiar_stranger/Screen/Home/Home.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:familiar_stranger/network/restApi.dart';
import 'package:flutter/material.dart';
import 'package:familiar_stranger/models/user.dart';
import 'package:familiar_stranger/models/message.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatRoom_Body extends StatefulWidget {
  // final User targetUser; //Main
  final Friend targetUser;
  const ChatRoom_Body({Key? key, required this.targetUser}) : super(key: key);

  @override
  State<ChatRoom_Body> createState() => _ChatRoom_BodyState();
}

bool sendMessage(
    String text, String sourceId, String targetId, String time, bool isImage) {
  if (text != '') {
    socket.emit('message', {
      "message": text,
      "sourceId": sourceId,
      "targetId": targetId,
      "time": time,
      "isImage": isImage
    });
    return true;
  }
  return false;
}

class _ChatRoom_BodyState extends State<ChatRoom_Body> {
  Future<bool> pickImage() async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      image = await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        await uploadImageMessage(image!.path.toString());
        contentSend = imageId;
        return true;
      } else {
        //contentSend = '';
        return false;
        //print('sos');
      }
    } on PlatformException catch (e) {
      print(e);
      //contentSend = '';
      return false;
    }
  }

  void setMessage(bool isImage) {
    DateTime now = DateTime.now();
    String time = now.toString().substring(10, 16);
    if (sendMessage(contentSend, user.id, targetUser.userId, time, isImage)) {
      var msg = Message(
          senderId: user.id,
          time: time,
          text: (!isImage) ? contentSend : imageUrl,
          isImage: isImage);
      if (mounted) {
        setState(() {
          messages.add(msg);
        });
      } else {
        print('mounted err 3');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socket.on('message', (data) {
      print('on message successful');
      var msg = Message(
          senderId: data['sourceId'],
          time: data['time'],
          text: data['message'],
          isImage: data['isImage']);
      if (mounted) {
        setState(() {
          print(msg.text);
          messages.add(msg);
        });
      } else {
        print('mounted err 2');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    socket.off('message');
    //print('dispose message');
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Conservation(targetUser: widget.targetUser), //Get conservation
                ),
              ),
            ),
            //const Spacer(),
            //Bottom Input bar
            Container(
              //alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              color: Colors.transparent,
              //height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      //height: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                  color: Main_Text, fontSize: 14),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Border_Color, width: 2.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Border_Color,
                                    width: 3.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Border_Color,
                                    width: 3.0,
                                  ),
                                ),
                                hintText: 'Type your message ...',
                                hintStyle: TextStyle(color: Colors.grey[500]),
                                suffixIcon: IconButton(
                                  onPressed: () async {
                                    (await pickImage())
                                        ? setMessage(true)
                                        : print('err send image');
                                  },
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                contentSend = value;
                              }, // get text to send
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  IconButton(
                    onPressed: () {
                      if (contentSend != '') {
                        setMessage(false);
                        scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                      }
                    },
                    icon: const Icon(
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
