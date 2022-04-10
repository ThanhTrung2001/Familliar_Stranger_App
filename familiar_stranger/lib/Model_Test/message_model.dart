import 'package:familiar_stranger/constant.dart';

import './user_model.dart';

class Message {
  final User sender;
  final String? avatar;
  final String time;
  final int? unreadCount;
  final bool? isRead;
  final String text;

  Message({
    required this.sender,
    this.avatar,
    required this.time,
    this.unreadCount,
    required this.text,
    this.isRead,
  });
}

final List<Message> recentChats = [
  Message(
    sender: kodoku,
    avatar: 'assets/Images/avatar.jpg',
    time: '01:25',
    text: "typing...",
    unreadCount: 1,
  ),
  Message(
    sender: jason,
    avatar: 'assets/Images/avatar.jpg',
    time: '12:46',
    text: "Will I be in it?",
    unreadCount: 1,
  ),
  Message(
    sender: deanna,
    avatar: 'assets/Images/avatar.jpg',
    time: '05:26',
    text: "That's so cute.",
    unreadCount: 3,
  ),
  Message(
      sender: nathan,
      avatar: 'assets/Images/avatar.jpg',
      time: '12:45',
      text: "Let me see what I can do.",
      unreadCount: 2),
];

final List<Message> allChats = [
  Message(
    sender: virgil,
    avatar: 'assets/Images/avatar.jpg',
    time: '12:59',
    text: "No! I just wanted",
    unreadCount: 0,
    isRead: true,
  ),
  Message(
    sender: stanley,
    avatar: 'assets/Images/avatar.jpg',
    time: '10:41',
    text: "You did what?",
    unreadCount: 1,
    isRead: false,
  ),
  Message(
    sender: leslie,
    avatar: 'assets/Images/avatar.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: judd,
    avatar: 'assets/Images/avatar.jpg',
    time: '10:16',
    text: "May I ask you something?",
    unreadCount: 2,
    isRead: false,
  ),
];

final List<Message> messages = [
  Message(
    sender: kodoku,
    time: '12:11 AM',
    avatar: kodoku.avatar,
    text: "...",
  ),
  Message(
    sender: kodoku,
    time: '12:10 AM',
    avatar: kodoku.avatar,
    text: "...",
  ),
  Message(
    sender: kodoku,
    time: '12:09 AM',
    avatar: kodoku.avatar,
    text: "...",
  ),
  Message(
    sender: currentUser,
    time: '12:05 AM',
    isRead: true,
    text: "I’m going home.",
  ),
  Message(
    sender: currentUser,
    time: '12:05 AM',
    isRead: true,
    text: "See, I was right, this doesn’t interest me.",
  ),
  Message(
    sender: kodoku,
    time: '11:58 PM',
    avatar: kodoku.avatar,
    text: "I sign your paychecks.",
  ),
  Message(
    sender: kodoku,
    time: '11:58 PM',
    avatar: kodoku.avatar,
    text: "You think we have nothing to talk about?",
  ),
  Message(
    sender: currentUser,
    time: '11:45 PM',
    isRead: true,
    text:
        "Well, because I had no intention of being in your office. 20 minutes ago",
  ),
  Message(
    sender: kodoku,
    time: '11:30 PM',
    avatar: kodoku.avatar,
    text: "I was expecting you in my office 20 minutes ago.",
  ),
];