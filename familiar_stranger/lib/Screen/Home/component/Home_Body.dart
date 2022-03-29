import 'dart:async';

import 'package:familiar_stranger/Screen/Home/component/home_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Home_Body extends StatefulWidget {
  const Home_Body({ Key? key }) : super(key: key);

  @override
  State<Home_Body> createState() => _Home_BodyState();
}

class _Home_BodyState extends State<Home_Body> {
  
  //Press Button
  bool start = true;
  void press_start(){
    setState(() {
      start = !start;
      if(start == false)
      {
        startTimer();
      }
      else
      {
        Reset();
        setState(()=>timer?.cancel());
      }
    });
  }
  //Timer
  Duration duration = Duration();
  Timer? timer;
  @override
  void initState(){
    super.initState();
    // startTimer();
  }

  void addTime(){
    final countUp = 1;

    setState(() {
      final second = duration.inSeconds + countUp;
      duration = Duration(seconds: second);
    });
  }

  void Reset(){
    setState(() {
      duration = Duration();
    });
  }

  void Stop(){
    setState(() => timer?.cancel()
    );
  }
  void Continue(){
    
  }

  void startTimer(){
    timer = Timer.periodic(Duration(seconds : 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {

    String twoZero(int n) => n.toString().padLeft(2, '0');
    final minutes = twoZero(duration.inMinutes.remainder(60));
    final seconds = twoZero(duration.inSeconds.remainder(60));
    
    Size size  = MediaQuery.of(context).size;
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
              SizedBox(width: 8,),
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
               child: Icon((start == true) ? Icons.play_arrow_rounded : Icons.pause_rounded, size: 150,),
             )),
          Container(
            child: Text((start == true) ? "START PAIRING?" : "STOP FINDING?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Main_Text),)), 
          SizedBox(
            height: size.height*0.05,
          ),
        ],
      ),
    );
  }
  Widget buildTimeCard({required String time, required String header}) 
  =>Column(
    children: [
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(
          time,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 72,
          ),
          ),
      ),
      SizedBox(height: 17,),
      Text(header, style: TextStyle(color: Main_Text),),
    ],
  );
}
