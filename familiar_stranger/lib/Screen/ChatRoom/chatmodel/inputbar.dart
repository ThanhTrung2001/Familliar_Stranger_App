// import 'package:flutter/material.dart';
// import 'package:familiar_stranger/constant.dart';

// //Container contain all about the bottombar of chatRoom -> which will get text from people to send to another
// Container buildInputBar() {
//   return Container(
//     padding: EdgeInsets.symmetric(horizontal: 20),
//     color: Colors.transparent,
//     height: 100,
//     child: Row(
//       children: [
//         Expanded(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 14),
//             height: 60,
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: TextField(
//                     style: TextStyle(color: Main_Text, fontSize: 14),
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Border_Color, width: 2.0),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(
//                           color: Border_Color,
//                           width: 3.0,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: BorderSide(
//                           color: Border_Color,
//                           width: 3.0,
//                         ),
//                       ),
//                       hintText: 'Type your message ...',
//                       hintStyle: TextStyle(color: Colors.grey[500]),
//                       suffixIcon: IconButton(
//                         onPressed: () {
                          
//                         },
//                         icon: Icon(
//                           Icons.camera_alt_outlined,
//                           //Icons.emoji_emotions_outlined,
//                           color: Colors.grey[500],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 16,
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.send,
//             size: 30,
//             color: Sub_Text,
//           ),
//         ),
//       ],
//     ),
//   );
// }
