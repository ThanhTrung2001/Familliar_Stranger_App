import 'dart:convert';

import 'package:familiar_stranger/Screen/ChatRoom/ChatRoom.dart';
import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:familiar_stranger/models/song.dart';
import 'package:familiar_stranger/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

Future<bool> submitLogin(phoneNumber, password) async {
  var response = await http.post(Uri.https(domain, 'user/login'),
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

Future<bool> submitSignUp(phoneNumber, password) async {
  var response = await http.post(Uri.http(domain, '/user/signup'),
      body: ({
        'phonenumber': phoneNumber,
        'password': password,
        'username': 'unknow'
      }));
  var jsonData = jsonDecode(response.body);
  if (jsonData['message'] == 'create successful') {
    print('Sign up successful');
    return true;
    //user = User.fromJson(jsonData['user']);
  } else {
    print('Sign up err');
    return false;
  }
}

Future<bool> submitLogout() async {
  var response = await http.get(Uri.http(domain, '/user/logout/${user.id}'));
  var jsonData = jsonDecode(response.body);
  if (jsonData['message'] == 'log out successful') {
    print('logout');
    return true;
  }
  return false;
}

Future<bool> submitUpdate(String username, String age) async {
  late String sex;
  if (sex_male == true) {
    sex = 'male';
  } else {
    sex = 'female';
  }

  var response = await http.post(
      Uri.http(domain, 'user/${user.id}/updateinfo'),
      body: ({'username': username, 'age': age, 'sex': sex}));

  var jsonData = jsonDecode(response.body);
  print(jsonData['message']);

  return false;
}

Future<bool> uploadAvatar(path) async {
  var request = http.MultipartRequest(
      'POST', Uri.http(domain, '/user/${user.id}/upAvatar'));
  request.files.add(await http.MultipartFile.fromPath('avatar', path));
  request.headers.addAll({
    "Content-Type": "multipart/form-data"
    //author...
  });
  var response = await request.send();
  //var jsonData = jsonDecode(response.body);
  final respStr = await response.stream.bytesToString();
  var jsonData = jsonDecode(respStr);
  if (jsonData['message'] == 'Up avatar successful') {
    user.avatarUrl = jsonData['avatarUrl'];
    print(jsonData['message']);
    return true;
  }
  return false;
}

Future<bool> uploadImageMessage(path) async {
  var request = http.MultipartRequest('POST', Uri.http(domain, '/user/sendImageMessage'));
  request.files.add(await http.MultipartFile.fromPath('image', path));
  request.headers.addAll({
    "Content-Type": "multipart/form-data"
    //author...
  });
  var response = await request.send();
  //var jsonData = jsonDecode(response.body);
  final respStr = await response.stream.bytesToString();
  var jsonData = jsonDecode(respStr);
  if (jsonData['message'] == 'Up image message successful') {
    imageId = jsonData['imageId'];
    imageUrl = jsonData['imageUrl'];
    print(jsonData['message']);
    return true;
  }

  return false;
}

Future<String> changePassword(oldPass, newPass) async {
  var response = await http.post(
      Uri.http(domain, '/user/${user.id}/changePassword'),
      body: ({'oldPassword': oldPass, 'newPassword': newPass}));
  var jsonData = jsonDecode(response.body);
  if (jsonData['message'] == 'Change password successful') {
    return 'done';
  } else if (jsonData['message'] == 'Old password does not match') {
    return 'dont match';
  }
  return 'err';
}

Future<bool> getListFriend() async {
  listFriend = [];
  var response =
      await http.get(Uri.http(domain, '/user/${user.id}/getListFriend'));
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

Future<bool> submitAddFriend(targerId) async {
  var response = await http
      .get(Uri.http(domain, '/user/${user.id}/addfriend/$targerId'));
  var jsonData = jsonDecode(response.body);
  if (jsonData['message'] == 'add friend successful') {
    return true;
  }
  return false;
}

Future<bool> submitDeleteFriend(targerId) async {
  var response = await http
      .delete(Uri.http(domain, '/user/${user.id}/deletefriend/$targerId'));
  var jsonData = jsonDecode(response.body);
  if (jsonData['message'] == 'delete done') {
    return true;
  }
  return false;
}

Future<bool> sendReport(content) async {
  var response = await http.post(
      Uri.http(domain, '/report/${user.id}/sendreport/${targetUser.userId}'),
      body: ({'content': content}));
  var jsonData = jsonDecode(response.body);
  if (jsonData['message'] == 'successful') {
    return true;
  }
  return false;
}

Future<bool> getTargetData(targetId) async {
  var response = await http.get(Uri.http(domain, '/user/$targetId'));
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
  var response = await http.get(Uri.http(domain, '/music'));
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
