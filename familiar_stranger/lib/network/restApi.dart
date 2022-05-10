import 'dart:convert';

import 'package:familiar_stranger/constant.dart';
import 'package:familiar_stranger/models/friend.dart';
import 'package:familiar_stranger/models/user.dart';
import 'package:http/http.dart' as http;

Future<bool> submitLogin(phoneNumber, password) async {
    var response = await http.post(
      Uri.http(addressIP, 'user/login'),
      body: ({
        'phonenumber': phoneNumber,
        'password': password
      })
    );
    var jsonData = jsonDecode(response.body);
    if(jsonData['type'] == 'login successful'){
      print('login successful');
      user = User.fromJson(jsonData['user']);
      return true;
    }else{
      print('err');
      return false;
    }
  }

Future<void> submitSignUp(phoneNumber, password) async {
  var response = await http.post(
    Uri.http(addressIP, 'user/signup'),
    body: ({
      'phonenumber': phoneNumber,
      'password': password,
      'username': 'unknow'
      })
  );
  var jsonData = jsonDecode(response.body);
  if(jsonData['message'] == 'create successful'){
    print('Sign up successful');
    //user = User.fromJson(jsonData['user']);
    }else{
      print('err');
    }
}

Future<bool>getListFriend() async {
  listFriend = [];
  var response = await http.get(Uri.http(addressIP, 'user/' + user.id + '/getListFriend'));
  var jsonData = jsonDecode(response.body);
  if(jsonData['message'] == 'get list friend'){
    print('succesful');
    if (jsonData['arrTemp'] != null) {
      listFriend = [];
      jsonData['arrTemp'].forEach((v) {
        listFriend.add(new Friend.fromJson(v));
      });
    }
    print(listFriend.length);
    return true;
  }else{
    return false;
  }
}

  Future<bool> getTargetData(targetId) async {
    var response = await http.get(Uri.http(addressIP, 'user/' + targetId));
    var jsonData = jsonDecode(response.body);
    if(jsonData['message'] == 'get one'){
      targetUser = User.fromJson(jsonData['user']);
      return true;
    }else{
      print('err');
      return false;
    }
  }
