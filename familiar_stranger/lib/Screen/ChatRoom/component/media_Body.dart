import 'package:audioplayers/audioplayers.dart';
import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
//import 'package:familiar_stranger/Model_Test/music_model.dart';
import 'package:familiar_stranger/Screen/ChatRoom/component/chatRoom_BG.dart';
import 'package:familiar_stranger/Screen/ChatRoom/musicmodel/musicModel.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:familiar_stranger/models/song.dart';
import 'package:flutter/material.dart';

class Media_Body extends StatefulWidget {
  const Media_Body({Key? key}) : super(key: key);

  @override
  State<Media_Body> createState() => _Media_BodyState();
}

class _Media_BodyState extends State<Media_Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socket.on('addSong', (song) {
      Song temp = Song(id: song['id'], name: song['name'], avatarUrl: song['avatarUrl'], link: song['link'], select: false, singer: song['singer']);
      setState(() {
        selectedSongs.add(temp);
        url = selectedSongs.first.link;
        title = selectedSongs.first.name;
        singer = selectedSongs.first.singer;
      });
      for (int i = 0; i < allSongs.length; i++) {
        if (temp.id == allSongs[i].id) {
          allSongs[i].select = true;
          break;
        }
      }
    });
    socket.on('deleteSong', (song) {
      Song temp = Song(id: song['id'], name: song['name'], avatarUrl: song['avatarUrl'], link: song['link'], select: true, singer: song['singer']);

      for (int i = 0; i < allSongs.length; i++) {
        if (temp.id == allSongs[i].id) {
          allSongs[i].select = false;
          break;
        }
      }
      //for(int i =0;i<)
      setState(() {
        //selectedSongs.indexWhere((element) => element.id ==song['id']);
        //print(selectedSongs);
        //print(selectedSongs.indexWhere((element) => element.id ==song['id']));
        selectedSongs.removeAt(selectedSongs.indexWhere((element) => element.id == song['id']));
        selectedSongs.length;
      });
    });
    socket.on('play', (data) {
      isPlay();
      audioPlayer.play(url, volume: 15);
    });
    socket.on('pause', (data) {
      isPause();
      audioPlayer.pause();
    });
  }

  @override
  void dispose() {
    super.dispose();
    socket.off('addSong');
    socket.off('deleteSong');
    socket.off('play');
    socket.off('pause');
  }

  var audioPlayer = AudioPlayer(); // playing
  Duration start = Duration.zero; // duration when start
  Duration end = Duration.zero; // duration of the song
  @override
  void press_play() {
    this.setState(() {
      isPlaying = !isPlaying;
    });
  }

  void isPlay() {
    if (isPlaying == true) {
    } else {
      press_play();
    }
  }

  void isPause() {
    if (isPlaying == false) {
    } else {
      press_play();
    }
  }

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
              IconButton(
                onPressed: () {
                  loadAllSongs();
                },
                icon: Icon(
                  Icons.view_list,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Now Playing...",
                style: TextStyle(
                    color: Sub_Text, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  loadSelectedSongs();
                },
                icon: Icon(
                  Icons.library_music_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
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
                radius: 150.0,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            title, //constant
            style: TextStyle(
                color: Main_Text, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Text(
            singer, //constant
            style: TextStyle(
                color: Sub_Text, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          //SLider in here

          Container(
            height: size.height * 0.155,
            width: size.width * 0.85,
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
                    // Padding(
                    //   padding: const EdgeInsets.all(5.0),
                    //   child: FloatingActionButton(
                    //     backgroundColor: Sub_Text,
                    //     mini: true,
                    //     onPressed: () {},
                    //     child: Icon(
                    //       Icons.skip_previous_rounded,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    FloatingActionButton(
                      backgroundColor: Sub_Text,
                      child: Icon(
                        (isPlaying)
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 50,
                      ),
                      onPressed: () async {
                        (isPlaying == false) ? isPlay() : isPause();
                        if (isPlaying == false) {
                          socket.emit('pause', targetUser.userId);
                          await audioPlayer.pause();
                        } else {
                          socket.emit('play', targetUser.userId);
                          url =
                              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
                          await audioPlayer.play(url, volume: 15);
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton(
                        backgroundColor: Sub_Text,
                        onPressed: () async {
                          if (selectedSongs.length <= 1) {
                          } else {
                            await audioPlayer.pause();
                            selectedSongs.removeAt(0);
                            setState(() {
                              url = selectedSongs.first.link;
                              title = selectedSongs.first.name;
                              singer = selectedSongs.first.singer;
                            });
                            await audioPlayer.play(url, volume: 15);
                            isPlaying = true;
                          }
                        },
                        child: Icon(
                          Icons.skip_next_rounded,
                          color: Colors.white,
                          size: 50,
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
        builder: (context) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
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
                      textInputType: TextInputType.text,
                    ),
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
                  itemCount: allSongs.length,
                  itemBuilder: (context, index) {
                    final select = allSongs[index];
                    return AllSong_Model(
                        avatar: select.avatarUrl,
                        name: select.name,
                        singer: select.singer,
                        tap: () {
                          if (select.select == false) {
                            socket.emit('addSong', {select, targetUser.userId});
                            setState(() {
                              selectedSongs.add(select);
                              url = selectedSongs.first.link;
                              title = selectedSongs.first.name;
                              singer = selectedSongs.first.singer;
                            });
                            select.select = true;
                          }
                        });
                  },
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
        builder: (context) {
          return StatefulBuilder(// Use to update
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: selectedSongs.length,
                    itemBuilder: (context, index) {
                      final select = selectedSongs[index];

                      return AllSong_Model(
                          avatar: select.avatarUrl,
                          name: select.name,
                          singer: select.singer,
                          tap: () {
                            socket.emit('deleteSong', {select, targetUser.userId});
                            //select.select == false;
                            for (int i = 0; i < allSongs.length; i++) {
                              if (select.id == allSongs[i].id) {
                                allSongs[i].select = false;
                                break;
                              }
                            }
                            setState(() {
                              if(select == selectedSongs.first)
                              {
                                url = "";
                              }
                              else
                              {
                                selectedSongs.remove(select);
                                selectedSongs.length;
                                url = selectedSongs.first.link;
                              }
                              
                            });
                          });
                    },
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
        });
  }
}
