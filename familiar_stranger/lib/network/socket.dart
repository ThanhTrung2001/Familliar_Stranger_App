// import 'package:familiar_stranger/constant.dart';
// import 'package:familiar_stranger/network/restApi.dart';
// import 'package:socket_io_client/socket_io_client.dart' as socketio;

//   void connectSocket() {
//     socket = socketio.io('http://'+addressIP, <String, dynamic>{
//       'transports':['websocket'],
//       'autoConnect': false,
//     });
//     socket.connect();
//     socket.emit('sigin', user.id);
//     socket.onConnect((data) {
//       print('Connected');
//       socket.on('toConversation', (targetData) {

//         //press_start();

//         print('to conversation');
//         toConversation(targetData[0]);
//       });
//     });
//   }
