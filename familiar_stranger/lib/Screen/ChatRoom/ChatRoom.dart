import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/Screen/ChatRoom/component/Media_Body.dart';
import 'package:familiar_stranger/Screen/ChatRoom/component/chatRoom_Body.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/friendList.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class ChatRoom_Screen extends StatefulWidget {
  final User user;
  const ChatRoom_Screen({
    Key? key,
    required this.user,
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
            // leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),),
            backgroundColor: Color.fromARGB(255, 83, 59, 91),
            title: Text(
              "ChatRoom",
              style: TextStyle(
                  fontSize: 20.0, fontFamily: 'ZenDots', color: Main_Text),
            ),
            centerTitle: true,
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
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
                user: widget.user,
              ),
              Media_Body(),
            ],
          ),
        ),
      ),
    );
  }
}
