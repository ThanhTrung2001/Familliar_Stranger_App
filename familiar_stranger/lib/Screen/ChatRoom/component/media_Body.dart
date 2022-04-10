import 'package:familiar_stranger/Screen/ChatRoom/component/chatRoom_BG.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Media_Body extends StatefulWidget {
  const Media_Body({Key? key}) : super(key: key);

  @override
  State<Media_Body> createState() => _Media_BodyState();
}

class _Media_BodyState extends State<Media_Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChatRoom_BG(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 80,
              ),
              Text(
                "Now Playing",
                style: TextStyle(
                    color: Sub_Text, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 30,),
              IconButton(onPressed: (){}, icon: Icon(Icons.library_music_outlined, color: Colors.white,size: 30,),)
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              color: Sub_Text,
              borderRadius: BorderRadius.circular(200.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.imgur.com/DSG7rkv.jpg'),
                radius: 120.0,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Title.................",
            style: TextStyle(
                color: Main_Text, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Text(
            "Singer",
            style: TextStyle(
                color: Sub_Text, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          //SLider in here

          SizedBox(
            height: size.height * 0.07,
          ),
          Container(
            height: size.height*0.165,
            width: size.width*0.85,
            decoration: BoxDecoration(
              color: Color.fromARGB(150, 116, 88, 116),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      hoverColor: Colors.black,
                      backgroundColor: Transp_Color,
                      elevation: 0,
                      mini: true,
                      onPressed: () {},
                      child: Icon(
                        Icons.shuffle_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FloatingActionButton(
                        backgroundColor: Sub_Text,
                        mini: true,
                        onPressed: () {},
                        child: Icon(
                          Icons.skip_previous_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Sub_Text,
                      onPressed: () {},
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FloatingActionButton(
                        backgroundColor: Sub_Text,
                        mini: true,
                        onPressed: () {},
                        child: Icon(
                          Icons.skip_next_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      hoverColor: Colors.black,
                      backgroundColor: Transp_Color,
                      elevation: 0,
                      mini: true,
                      onPressed: () {},
                      child: Icon(
                        Icons.repeat_one_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ]),
            ),
            ),
        ],
      ),
    );
  }
}
