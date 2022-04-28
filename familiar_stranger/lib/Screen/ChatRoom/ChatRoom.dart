//import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/Screen/ChatRoom/component/Media_Body.dart';
import 'package:familiar_stranger/Screen/ChatRoom/component/chatRoom_Body.dart';
import 'package:familiar_stranger/Screen/Home/component/Home_Body.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/friendList.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/report.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';
import 'package:familiar_stranger/models/user.dart';

class ChatRoom_Screen extends StatefulWidget {
  //
  final User targetUser;
  const ChatRoom_Screen({
    Key? key,
    required this.targetUser,
  }) : super(key: key);
  @override
  State<ChatRoom_Screen> createState() => _ChatRoom_ScreenState();
}

class _ChatRoom_ScreenState extends State<ChatRoom_Screen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                //socket.disconnect();
                //print('object');
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            backgroundColor: Color.fromARGB(255, 83, 59, 91),
            title: Text(
              "ChatRoom",
              style: TextStyle(
                  fontSize: 20.0, fontFamily: 'ZenDots', color: Main_Text),
            ),
            centerTitle: true,
            actions: [ // Menu popup
              PopupMenuButton<int>(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Text('Report'),
                        ),
                        PopupMenuDivider(),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Text('Cancel'),
                        ),
                      ]),
            ],
            bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color: Colors.greenAccent),
              tabs: [
                Tab(icon: Icon(Icons.chat_bubble)),
                Tab(icon: Icon(Icons.music_note_rounded)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ChatRoom_Body(
                targetUser: widget.targetUser,
              ),
              Media_Body(),
            ],
          ),
        ),
      ),
    );
  }
}

//function routing by popup menu
void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => Report_Screen()),
      );
      break;
    case 1:
      break;
  }
}
