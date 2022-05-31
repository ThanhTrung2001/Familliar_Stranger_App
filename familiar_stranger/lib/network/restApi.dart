import 'dart:convert';

import 'package:familiar_stranger/Screen/ChatRoom/ChatRoom.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:familiar_stranger/models/song.dart';
import 'package:familiar_stranger/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> submitLogin(phoneNumber, password) async {
  var response = await http.post(Uri.http(addressIP, 'user/login'),
      body: ({'phonenumber': phoneNumber, 'password': password}));
  var jsonData = jsonDecode(response.body);
  if (jsonData['type'] == 'login successful') {
    user = User.fromJson(jsonData['user']);
    print('login successful' + user.id);

    return true;
  } else {
    print('login err');
    return false;
  }
}

Future<void> submitSignUp(phoneNumber, password) async {
  var response = await http.post(Uri.http(addressIP, 'user/signup'),
      body: ({
        'phonenumber': phoneNumber,
        'password': password,
        'username': 'unknow'
      }));
  var jsonData = jsonDecode(response.body);
  if (jsonData['message'] == 'create successful') {
    print('Sign up successful');
    //user = User.fromJson(jsonData['user']);
  } else {
    print('Sign up err');
  }
}

Future<bool> submitLogout() async {
  return false;
}

Future<bool> getListFriend() async {
  listFriend = [];
  var response =
      await http.get(Uri.http(addressIP, 'user/' + user.id + '/getListFriend'));
  var jsonData = jsonDecode(response.body);
  if (jsonData['message'] == 'get list friend') {
    //print('succesful');
    if (jsonData['arrTemp'] != null) {
      listFriend = [];
      jsonData['arrTemp'].forEach((v) {
        listFriend.add(Friend.fromJson(v));
      });
    }
    //print(listFriend.length);
    return true;
  } else {
    return false;
  }
}

Future<bool> getTargetData(targetId) async {
  var response = await http.get(Uri.http(addressIP, 'user/' + targetId));
  var jsonData = jsonDecode(response.body);
  if (jsonData['message'] == 'get one') {
    targetUser = Friend.fromJson(jsonData['user']);
    return true;
  } else {
    print('err');
    return false;
  }
}

Future<bool> getAllSongs() async {
  var response = await http.get(Uri.http(addressIP, 'music'));
  var jsonData = jsonDecode(response.body);
  if (jsonData['message'] == 'get all song') {
    allSongs = [];
    jsonData['data'].forEach((v) {
      allSongs.add(Song.fromJson(v));
    });
    return true;
  }
  return false;
}
