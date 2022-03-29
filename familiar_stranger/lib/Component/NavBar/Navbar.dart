import 'package:familiar_stranger/constant.dart';
import 'package:flutter/material.dart';
import 'package:familiar_stranger/Component/NavBar/route.dart' as route;

class Nav_Bar extends StatelessWidget {
  const Nav_Bar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Container(
        color: Color.fromARGB(255, 83, 59, 91),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              child: UserAccountsDrawerHeader(
                accountName: Text("Kodoku", style: TextStyle(color: Main_Text, fontWeight: FontWeight.bold),), 
                accountEmail: Text("", style: TextStyle(color: Main_Text, fontWeight: FontWeight.normal),),
                currentAccountPicture: CircleAvatar(  
                  child: ClipOval(
                    child: Image.network(
                      "https://i.imgur.com/DSG7rkv.jpg",
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      )
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage("https://i.imgur.com/qywe4pq.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
                    
                  ),
                ),
                ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 35, top: 10),
              leading: Icon(Icons.home, color: Main_Text,),
              title: Text("Home", style: TextStyle(fontSize: 15,color: Main_Text, fontWeight: FontWeight.bold),),
              onTap: () {},
            ),
            Divider(
              color: Main_Text,
              thickness: 2,
              indent: 30,
              endIndent: 100,
            ),
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
              onTap: () {},
            ),
          
            ListTile(
              contentPadding: EdgeInsets.only(left: 35, top: 10),
              leading: Icon(Icons.settings, color: Main_Text,),
              title: Text("Setting", style: TextStyle(fontSize: 15,color: Main_Text, fontWeight: FontWeight.bold),),
              onTap: () => Navigator.pushNamed(context, route.setting),
            ),
            Divider(
              color: Main_Text,
              thickness: 2,
              indent: 30,
              endIndent: 100,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 35, top: 10),
              leading: Icon(Icons.logout_outlined, color: Main_Text,),
              title: Text("Log Out", style: TextStyle(fontSize: 15,color: Main_Text, fontWeight: FontWeight.bold),),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}