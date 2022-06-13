import 'package:familiar_stranger/constant.dart';

// import './user_model.dart';
import 'package:familiar_stranger/models/user.dart';

class Message {
  final String senderId;
  final String? avatar;
  final String time;
  final int? unreadCount;
  final bool? isRead;
  final bool  isImage;
  final String text;

  Message({
    required this.senderId,
    this.avatar,
    required this.time,
    this.unreadCount,
    required this.text,
    required this.isImage,
    this.isRead
  });
}

late List<Message> messages = [];

