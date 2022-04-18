import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
import 'package:familiar_stranger/Model_Test/music_model.dart';
import 'package:familiar_stranger/Screen/ChatRoom/component/chatRoom_BG.dart';
import 'package:familiar_stranger/Screen/ChatRoom/musicmodel/musicModel.dart';
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
              IconButton(onPressed: (){loadAllSongs();}, icon: Icon(Icons.view_list, color: Colors.white,size: 30,),),
              SizedBox(
                width: 30,
              ),
              Text(
                "Now Playing...",
                style: TextStyle(
                    color: Sub_Text, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 30,),
              IconButton(onPressed: (){loadSelectedSongs();}, icon: Icon(Icons.library_music_outlined, color: Colors.white,size: 30,),)
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Container(
            height: size.height * 0.31,
            decoration: BoxDecoration(
              color: Sub_Text,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.imgur.com/DSG7rkv.jpg'),
                radius: 200.0,
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
            child: Container(
              // padding: const EdgeInsets.only(top : 10.0, bottom: 10 ),
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
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
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
                      padding: const EdgeInsets.all(5.0),
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
                      width: 10,
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
  void loadAllSongs() {
  showModalBottomSheet(
    backgroundColor: Color.fromARGB(255, 95, 94, 94),
    context: context, 
    builder: (context){
        return Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                width: 200,
                height: 50,
                child: Rounded_TextField_Center(
                    onchanged: (value) {},
                    hint: "Seacrh...",
                    IsPassword: false,
                    textInputType: TextInputType.text,),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Main_Text,
                  size: 30,
                ),
              ),
              ],
            ),
            Expanded(
                  child: ListView.separated(
                    itemCount: AllSongs.length,
                    itemBuilder: (context, index) { 
                      final select = AllSongs[index];
                      return AllSong_Model(avatar: select.avatar, name: select.name, singer: select.singer, tap: (){
                        setState(() {
                          SelectedSongs.add(select);
                        });
                      });},
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 2,
                          indent: 100,
                          endIndent: 100,
                          color: Colors.black,
                        );
                      },
                    ),
                    ),
          ],
        );
    });
  }

  void loadSelectedSongs() {
  showModalBottomSheet(
    backgroundColor: Color.fromARGB(255, 95, 94, 94),
    context: context, 
    builder: (context){
        return StatefulBuilder( // Use to update
          builder: (BuildContext context, StateSetter setState) {
            return Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Expanded(
                  child: ListView.separated(
                    itemCount: SelectedSongs.length,
                    itemBuilder: (context, index) { 
                      final select = SelectedSongs[index];
                      return AllSong_Model(avatar: select.avatar, name: select.name, singer: select.singer, tap: (){
                        setState(() {
                          SelectedSongs.remove(select);
                          SelectedSongs.length;
                        });
                      });},
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 2,
                          indent: 100,
                          endIndent: 100,
                          color: Colors.black,
                        );
                      },
                    ),
                    ),
          ],
        );
        }
        );
    });
  }
}


