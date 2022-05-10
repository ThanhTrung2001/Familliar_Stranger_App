import 'dart:async';
import 'dart:convert';

import 'package:familiar_stranger/Screen/ChatRoom/ChatRoom.dart';
import 'package:familiar_stranger/Screen/Home/component/home_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/user.dart';
import 'package:familiar_stranger/models/message.dart';
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

    //late socketio.Socket socket;

  void connectSocket() {
    socket = socketio.io('http://'+addressIP, <String, dynamic>{
      'transports':['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.emit('sigin', user.id);
    socket.onConnect((data) {
      print('Connected');
      socket.on('toConversation', (targetData) {

        //press_start();

        print('to conversation');
        toConversation(targetData[0]);
      });
    });
  }

  void toConversation(id) async {
    if(await getTargetData(id) == true){
      print('123');
      Navigator.push(context, MaterialPageRoute(builder: (context){return ChatRoom_Screen(targetUser: targetUser);}));
    }else{
      print('err');
    }
  }

  // Future<bool> getTargetData(targetId) async {
  //   var response = await http.get(Uri.http(addressIP, 'user/' + targetId));
  //   var jsonData = jsonDecode(response.body);
  //   if(jsonData['message'] == 'get one'){
  //     targetUser = User.fromJson(jsonData['user']);
  //     return true;
  //   }else{
  //     print('err');
  //     return false;
  //   }
  // }

  // void toConversation(){
  //   socket.on('toConversation', (targetData){
  //     targetUser = User.fromJson({
  //       "_id": "625819d1e3fa573f5838629a",
  //       "username": "Di Hun",
  //       "phoneNumber": "0938085588",
  //       "avatarUrl": "https://res.cloudinary.com/fs-app/image/upload/v1650100065/lmns2fwar7jvflmqjwvs.png",
  //       "age": "21",
  //       "sex": "female"
  //     });
  //     Navigator.push(context, MaterialPageRoute(builder: (context){return ChatRoom_Screen(targetUser: targetUser);}));
  //   });
  // }

  //Press Button
  bool start = true;
  void press_start() {
    
    //print(targetUser.id);
    //Navigator.push(context, MaterialPageRoute(builder: (context){return ChatRoom_Screen(targetUser: targetUser);})); //command to test
    
    setState(() {
      start = !start;
      if (start == false) {
        connectSocket();
        socket.emit("connectId",user.id);
        startTimer();
      } else {
        socket.emit("deleteId",user.id);
        //socket.disconnect();
        //socket.destroy();
        
        
        Reset();
        setState(() => timer?.cancel());
      }
    });
  }

  //Timer
  Duration duration = Duration();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    // startTimer();
  }

  void addTime() {
    final countUp = 1;

    setState(() {
      final second = duration.inSeconds + countUp;
      duration = Duration(seconds: second);
    });
  }

  void Reset() {
    setState(() {
      duration = Duration();
    });
  }

  void Stop() {
    setState(() => timer?.cancel());
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
