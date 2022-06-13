import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';



class AllSong_Model extends StatelessWidget {
  final String avatar;
  final String name;
  final String singer;
  final VoidCallback tap;
   const AllSong_Model({ 
     Key? key,
     required this.avatar, 
     required this.name,
     required this.singer,
     required this.tap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0,right: 30.0,bottom: 5.0),
      child: GestureDetector(
        onTap: tap,
        child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(avatar),
            ),
            title: Text(name, style: TextStyle(color: Main_Text, fontSize: 15, fontWeight: FontWeight.bold),),
            subtitle: Text(singer, style: TextStyle(color: Sub_Text, fontSize: 10),),
            trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.check_circle_outline, color: Main_Text,)),
                    ],
                  ),
        ),
      ),
    );
  }
}