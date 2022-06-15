//import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_LogOut.dart';
import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/Screen/ChatRoom/component/Media_Body.dart';
import 'package:familiar_stranger/Screen/ChatRoom/component/chatRoom_Body.dart';
import 'package:familiar_stranger/Screen/Home/Home.dart';
import 'package:familiar_stranger/Screen/Home/component/Home_Body.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/friendList.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/report.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:familiar_stranger/models/message.dart';
import 'package:familiar_stranger/models/song.dart';
import 'package:flutter/material.dart';
import 'package:familiar_stranger/models/user.dart';

class ChatRoom_Screen extends StatefulWidget {
  //
  Friend targetUser;
  ChatRoom_Screen({
    Key? key,
    required this.targetUser,
  }) : super(key: key);
  @override
  State<ChatRoom_Screen> createState() => _ChatRoom_ScreenState();

  // static void popNavigator(BuildContext context) {
  //   Navigator.of(context).pop();
  //   Navigator.push(context, MaterialPageRoute(builder: (context){return Home_Screen();}));

  //   //Navigator.pop(context);
  // }
}

class _ChatRoom_ScreenState extends State<ChatRoom_Screen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socket.on('beDisconnectRoom', (data) {
      messages.clear();
      targetUser.clear();
      resetMedia();
      Navigator.of(context, rootNavigator: true).pop();
      print('beDisconnectRoom');
    });

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
    socket.off('beDisconnectRoom');
    //print('dispose beDisconnectRoom');
    print('dispose media');
    socket.off('addSong');
    socket.off('deleteSong');
    socket.off('play');
    socket.off('pause');

    messages.clear();
    resetMedia();
  }

  void resetMedia() {
    audioPlayer.release();
    isPlaying = false;
    url = "";
    title = "Title";
    singer = "Singer";
    avtSongUrl =
        "https://res.cloudinary.com/fs-app/image/upload/v1654774979/abc123_wi5uu0.jpg";

    for (var element in allSongs) {
      element.select = false;
    }
    selectedSongs.length = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog_LogOut(
                          title: "You sure want to quit?",
                          press_yes: () {
                            socket.emit('disconnectRoom', targetUser.userId);
                            //socket.emit('disconnectMedia', targetUser.userId);
                            print('disconnectRoom');
                            Navigator.of(context, rootNavigator: true).pop();
                            Navigator.of(context, rootNavigator: true).pop();
                          });
                    });
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
            actions: [
              // Menu popup
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
        MaterialPageRoute(
            builder: (context) => Report_Screen(
                  targetUser: targetUser,
                )),
      );
      break;
    case 1:
      showDialog(
          context: context,
          builder: (context) {
            return Dialog_LogOut(
                title: "You sure want to quit?",
                press_yes: () {
                  socket.emit('disconnectRoom', targetUser.userId);
                  //socket.emit('disconnectMedia', targetUser.userId);
                  print('disconnectRoom');
                  Navigator.of(context, rootNavigator: true).pop();
                  Navigator.of(context, rootNavigator: true).pop();
                });
          });
      break;
  }
}
