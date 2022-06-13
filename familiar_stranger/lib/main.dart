import 'package:familiar_stranger/Model_Test/user_model.dart';
import 'package:familiar_stranger/Screen/ChatRoom/chatRoom.dart';
import 'package:familiar_stranger/Screen/Home/home.dart';
import 'package:familiar_stranger/Screen/Login/login.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/friendList.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/friend_infor.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/friendmodel/friendmodel.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/profile.dart';
import 'package:familiar_stranger/Screen/Profile&Setting/report.dart';
import 'package:familiar_stranger/Screen/Welcome/welcome.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/Component/NavBar/route.dart' as route;
import 'package:familiar_stranger/network/restApi.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    print('dispose');
    super.dispose();
  }

  //late AppLifecycleState _notification;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // if (state == AppLifecycleState.detached ) {
    //   if (user.id.isNotEmpty) {
    //     submitLogout();
    //     socket.emit('logout', user.id);
    //     socket.off('connect');
    //     socket.disconnect();
    //     print('close app');
    //   }
    //   print('1');
    // }
    // if (state == AppLifecycleState.inactive ) {
    //   print('2');
    // }
    // if (state == AppLifecycleState.paused ) {
    //   if (user.id.isNotEmpty) {
    //     submitLogout();
    //     socket.emit('logout', user.id);
    //     socket.off('connect');
    //     socket.disconnect();
    //     print('close app');
    //   }

    //   print('3');
    // }
    // if (state == AppLifecycleState.resumed ) {
    //   socket.connect();
    //   print('4');
    // }

    // final isBackground = state == AppLifecycleState.paused;

    // if (isBackground) {
    //   if (user.id.isNotEmpty) {
    //     submitLogout();
        // socket.emit('logout', user.id);
        // socket.off('connect');
        // socket.disconnect();
    //   }
    // }

    // setState(() { _notification = state; });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Familiar Stranger',
      theme: ThemeData(
        primaryColor: Main_Text,
        scaffoldBackgroundColor: Background_Color,
        fontFamily: 'Roboto',
      ),
      home: Welcome_Screen(), //Welcome_Screen(),
      onGenerateRoute: route.controller,
      //change to edit screen, when all done, comment this line again
      initialRoute: route.login,
    );
  }
}
