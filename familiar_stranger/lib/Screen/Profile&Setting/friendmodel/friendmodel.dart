import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';

class Friend_Model extends StatelessWidget {
  final String userName;
  final String status;
  final String avatar;
  final VoidCallback tap;

  const Friend_Model({
     Key? key,
     required this.avatar, 
     required this.userName,
     required this.status,
     required this.tap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: tap,
        child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(avatar),
            ),
            title: Text(userName, style: TextStyle(color: Main_Text),),
            subtitle: Text(status, style: TextStyle(color: Main_Text),),
            trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit, color: Main_Text,)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete, color: Main_Text,)),
                    ],
                  ),
        ),
      ),
    );
  }
}