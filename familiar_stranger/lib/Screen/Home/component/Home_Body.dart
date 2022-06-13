import 'dart:async';
import 'dart:convert';

import 'package:familiar_stranger/Component/Dialog/dialog_Custom_LogOut.dart';
import 'package:familiar_stranger/Screen/ChatRoom/ChatRoom.dart';
import 'package:familiar_stranger/Screen/Home/component/home_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:familiar_stranger/network/restApi.dart';
import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as socketio;
import 'package:http/http.dart' as http;

class Home_Body extends StatefulWidget {
  const Home_Body({Key? key}) : super(key: key);

  @override
  State<Home_Body> createState() => _Home_BodyState();
}

class _Home_BodyState extends State<Home_Body> {
  Future<void> toConversation(id) async {
    Reset();
    acceptConversation = true;
    if (await getTargetData(id) == true) {
      print(acceptConversation);
      print(targetUser.userId);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ChatRoom_Screen(targetUser: targetUser);
      }));
    } else {
      print('err');
    }
  }

  //Press Button
  bool start = true;
  void press_start() {
    if (mounted) {
      setState(() {
        start = !start;
        if (start == false) {
          print('start');
          socket.emit("connectId", user.id);
          startTimer();
        } else {
          socket.emit("deleteId", user.id);

          Reset();
        }
      });
    } else {
      print('mounted err1');
    }
  }

  //Timer
  Duration duration = Duration();
  late Timer timer;
  @override
  void initState() {
    super.initState();

    socket.on('updateState', (data) async {
      await getListFriend();
    });

    ///init timer
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
    timer.cancel();
    duration = Duration();

    socket.on('toConversation', (targetData) {
      Reset();
      toConversation(targetData[0]);
    });

    socket.on('invite', (id) async {
      String name = await getName(id);
      showDialog(
          context: context,
          builder: (context) {
            bool pressYes = false;
            Future.delayed(Duration(seconds: 5), () async {
              if (!pressYes) {
                Navigator.of(context).pop();
              }
            });
            return Dialog_LogOut(
                title: "$name invite you",
                press_yes: () {
                  pressYes = true;
                  Navigator.of(context).pop();
                  socket.emit('acceptConversation', {user.id, id});
                  toConversation(id);
                });
          });
    });

    socket.on('acceptConversation', (id) {
      Navigator.pop(context);
      Navigator.pop(context);
      toConversation(id);
    });
  }

  Future<String> getName(id) async {
    for (int i = 0; i < listFriend.length; i++) {
      if (listFriend[i].userId == id) {
        return listFriend[i].username;
      }
    }
    return '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    socket.off('toConversation');
    socket.off('acceptConversation');
    socket.off('invite');
    socket.off('updateState');
  }

  void addTime() {
    final countUp = 1;

    setState(() {
      final second = duration.inSeconds + countUp;
      duration = Duration(seconds: second);
    });
  }

  void Reset() {
    socket.emit("deleteId", user.id);
    setState(() {
      print('reset');
      if (start == false) {
        start = true;
      }
      timer.cancel();
      duration = Duration();
    });
  }

  void Stop() {
    setState(() => timer.cancel());
  }

  void Continue() {}

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {
    String twoZero(int n) => n.toString().padLeft(2, '0');
    final minutes = twoZero(duration.inMinutes.remainder(60));
    final seconds = twoZero(duration.inSeconds.remainder(60));

    Size size = MediaQuery.of(context).size;
    return Home_BG(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.3,
          ),
          // Text('$minutes : $seconds', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildTimeCard(time: minutes, header: 'Mins'),
              SizedBox(
                width: 8,
              ),
              buildTimeCard(time: seconds, header: 'Secs'),
            ],
          ),
          Spacer(),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                shadowColor: Transp_Color,
                primary: Transp_Color,
                elevation: 0.0,
              ),
              onPressed: () => press_start(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  (start == true)
                      ? Icons.play_arrow_rounded
                      : Icons.pause_rounded,
                  size: 150,
                ),
              )),
          Container(
              child: Text(
            (start == true) ? "START PAIRING?" : "STOP FINDING?",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Main_Text),
          )),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white30, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 72,
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Text(
            header,
            style: TextStyle(color: Main_Text),
          ),
        ],
      );
}
