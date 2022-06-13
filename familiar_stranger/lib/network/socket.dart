import 'dart:math';

import 'package:familiar_stranger/Component/Dialog/dialog_Custom_LogOut.dart';
import 'package:familiar_stranger/Screen/ChatRoom/ChatRoom.dart';
import 'package:familiar_stranger/Screen/Home/Home.dart';
import 'package:familiar_stranger/Screen/Home/component/Home_Body.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:familiar_stranger/models/message.dart';
import 'package:familiar_stranger/network/restApi.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as socketio;

void connectSocket() {
  socket = socketio.io('http://' + domain, <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  });
  socket.connect();
  socket.emit('sigin', user.id);
  socket.on('connect', (data) {
    print('Connected');
  });
}
