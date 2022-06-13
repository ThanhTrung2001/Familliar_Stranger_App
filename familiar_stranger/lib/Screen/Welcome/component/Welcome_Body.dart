import 'package:familiar_stranger/Component/Button/rounded_Border.dart';
import 'package:familiar_stranger/Screen/Login/login.dart';
import 'package:familiar_stranger/Screen/Welcome/component/welcome_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Welcome_Body extends StatelessWidget {
  const Welcome_Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Welcomge_BG(
      child: IntroductionScreen(
        pages: [
          //1
          PageViewModel(
            title: 'WELCOME TO\nFAMILIAR STRANGER',
            body:  'An anonymous chatting application built by Flutter',
            image: Image.asset('Images/Welcome/Security.png',width: 350,),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(fontFamily: 'ZenDots',fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black),
              bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: Main_Text),
              imagePadding: EdgeInsets.all(24),
              pageColor: Color.fromARGB(255, 90, 48, 95),
            ),
          ),
          //2
          PageViewModel(
            title: 'BASE ON MESSENGER\nAND OUR OWN IDEA',
            body:  'Chatting with stranger all over the world',
            image: Image.asset('Images/Welcome/Chatting.png',width: 350,),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(fontFamily: 'ZenDots',fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black),
              bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: Main_Text),
              imagePadding: EdgeInsets.all(24),
              pageColor: Color.fromARGB(255, 90, 48, 95),
            ),
          ),
          //3
          PageViewModel(
            title: 'A FRIENDLY &\nSECURITY APPLICATION',
            body:  'Waiting few second to share happiness/sadness in life',
            image: Image.asset('Images/Welcome/Waiting.png',width: 350,),
            decoration: PageDecoration(
              titleTextStyle: TextStyle(fontFamily: 'ZenDots',fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black),
              bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: Main_Text),
              imagePadding: EdgeInsets.all(24),
              
              pageColor: Color.fromARGB(255, 90, 48, 95),
            ),
          ),
        ],
        globalBackgroundColor: Color.fromARGB(255, 90, 48, 95),
        showBackButton: true,
        showNextButton: true,
        next: Icon(Icons.arrow_forward_rounded, color: Main_Text,size: 50,),
        back: Icon(Icons.arrow_back_rounded, color: Main_Text,size: 50,),
        done: Text('ENTER', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
        onDone: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Login_Screen()));
        },
      )
    );
  }
}

