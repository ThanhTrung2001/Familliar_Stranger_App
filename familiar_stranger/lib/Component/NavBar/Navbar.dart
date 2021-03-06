import 'package:familiar_stranger/Component/Button/dialog_Button.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_LogOut.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_OneTextField.dart';
import 'package:familiar_stranger/Component/Dialog/dialog_Custom_WithIcon_Button.dart';
import 'package:familiar_stranger/Component/TextField/Login/rounded_TextField_Center.dart';
import 'package:familiar_stranger/Screen/Login/Login.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/network/restApi.dart';
import 'package:flutter/material.dart';
import 'package:familiar_stranger/Component/NavBar/route.dart' as route;

class Nav_Bar extends StatelessWidget {
  const Nav_Bar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 83, 59, 91),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Color.fromARGB(255, 83, 59, 91),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 35,),
                  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text( "FS", style: TextStyle(fontFamily: 'UncialAntiqua',fontSize: 64, color: Colors.white,),textAlign: TextAlign.center,),
                          SizedBox(
                            height: 10,
                          ), 
                          
                        ],
                      ),
                      ),
            Divider(
              color: Main_Text,
              thickness: 6,
              indent: 30,
              endIndent: 30,),
            ListTile(
              contentPadding: EdgeInsets.only(left: 40, top: 10),
              leading: Icon(Icons.home, color: Main_Text,),
              title: Text("Home", style: TextStyle(fontSize: 15,color: Main_Text, fontWeight: FontWeight.bold),),
              onTap: () {},
            ),
            // Divider(
            //   color: Main_Text,
            //   thickness: 2,
            //   indent: 30,
            //   endIndent: 100,
            // ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 35, top: 10),
              leading: Icon(Icons.person, color: Main_Text,),
              title: Text("Profile", style: TextStyle(fontSize: 15,color: Main_Text, fontWeight: FontWeight.bold),),
              onTap: () => Navigator.pushNamed(context, route.profile),
            ),
            
            ListTile(
              contentPadding: EdgeInsets.only(left: 35, top: 10),
              leading: Icon(Icons.people, color: Main_Text,),
              title: Text("Friends", style: TextStyle(fontSize: 15,color: Main_Text, fontWeight: FontWeight.bold),),
              onTap: () => Navigator.pushNamed(context, route.friend),
                
            ),

            ListTile(
              contentPadding: EdgeInsets.only(left: 35, top: 10),
              leading: Icon(Icons.add_circle_rounded, color: Main_Text,),
              title: Text("Add Friend", style: TextStyle(fontSize: 15,color: Main_Text, fontWeight: FontWeight.bold),),
              onTap: () => showDialog(context: context, builder: (context){
                return Dialog_Input_One(press_yes: ()async{
                  if(await submitAddFriend(UIDFriend)){
                    await getListFriend();
                    Navigator.pop(context);
                  }
                  //print(UIDFriend);
                  //use UID Friend in consstantt to add friend
                });
              }),
            ),
          
            ListTile(
              contentPadding: EdgeInsets.only(left: 35, top: 10),
              leading: Icon(Icons.settings, color: Main_Text,),
              title: Text("Setting", style: TextStyle(fontSize: 15,color: Main_Text, fontWeight: FontWeight.bold),),
              onTap: () => Navigator.pushNamed(context, route.setting),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 35, top: 10),
              leading: Icon(Icons.logout_outlined, color: Main_Text,),
              title: Text("Log Out", style: TextStyle(fontSize: 15,color: Main_Text, fontWeight: FontWeight.bold),),
              onTap: () {
                showDialog(context: context, builder: (context){ return Dialog_LogOut(title: "Log out?" ,press_yes: (){
                  submitLogout();
                  socket.emit('logout',user.id);
                  socket.emit('updateState',(user.id));
                  socket.off('connect');
                  socket.off('invite');
                  socket.disconnect();
                  Navigator.push(context, MaterialPageRoute(builder: (context){return const Login_Screen();}));
                });});
              },
            ),
          ],
        ),
      ),
    ],
    ),
    ),
    );
  }
}