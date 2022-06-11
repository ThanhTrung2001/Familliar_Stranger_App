import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/message.dart';
import 'package:familiar_stranger/network/restApi.dart';
import 'package:socket_io_client/socket_io_client.dart' as socketio;

  void connectSocket() {
    socket = socketio.io('https://'+domain, <String, dynamic>{
      'transports':['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.emit('sigin', user.id);
    socket.on('connect',(data) {
      print('Connected');
    });
  }
